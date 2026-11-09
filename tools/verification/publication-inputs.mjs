import assert from "node:assert/strict";
import { execFileSync } from "node:child_process";
import { createHash } from "node:crypto";
import { readFile, readdir } from "node:fs/promises";
import path from "node:path";

const MODEL_FORMAT = "architecture-publisher.model";
const WORK_FILES = new Set(["README.md", "model.json", "source.json"]);
/** An overview composition the publisher typesets: one Typst file beside the model. */
const COMPOSITION = /^[^/\\]+\.typ$/;
/** A guide the publisher delivers as the page: an Archify draft in a directory of its own. */
const GUIDE = /^(?!\.\.?\/)[^/\\]+\/[^/\\]+\.archify\.md$/;
const REVISION = /^([0-9a-f]{40}|[0-9a-f]{64})$/;
/** The languages the publisher reads; a work's translation lives in a directory named by one. */
const LOCALES = new Set(["en", "zh-CN", "zh-TW", "es", "ko"]);
/** What a translation holds beside its overview and guide: its model and the table that fixes its terms. */
const TRANSLATION_FILES = new Set(["model.json", "concepts.md"]);

const sha256 = (bytes) => createHash("sha256").update(bytes).digest("hex");
const readJson = async (file) => JSON.parse(await readFile(file, "utf8"));
const localFile = (directory, relative) => {
  assert.ok(typeof relative === "string" && relative.length > 0);
  const file = path.resolve(directory, relative);
  assert.ok(file.startsWith(`${directory}${path.sep}`));
  return file;
};

export async function verifyCustody(directory, repositoryRoot) {
  const source = await readJson(path.join(directory, "source.json"));
  assert.match(source.sourceCommit, /^[a-f0-9]{40}$/);
  assert.match(source.sourceTree, /^[a-f0-9]{40}$/);
  assert.match(source.preservationCommit, /^[a-f0-9]{40}$/);
  assert.ok(Array.isArray(source.members) && source.members.length > 0);
  const targets = new Set();
  for (const member of source.members) {
    assert.ok(typeof member.source === "string" && member.source.length > 0);
    const file = localFile(directory, member.target);
    assert.ok(!targets.has(file));
    targets.add(file);
    assert.ok(member.storage === undefined || member.storage === "git");
    const bytes =
      member.storage === "git"
        ? execFileSync(
            "git",
            [
              "show",
              `${source.preservationCommit}:${path.relative(repositoryRoot, file).split(path.sep).join("/")}`,
            ],
            {
              cwd: repositoryRoot,
              timeout: 10000,
              maxBuffer: 8 * 1024 * 1024,
              stdio: ["ignore", "pipe", "pipe"],
            },
          )
        : await readFile(file);
    assert.equal(bytes.length, member.bytes);
    assert.equal(sha256(bytes), member.sha256);
    if (file.endsWith(".json")) JSON.parse(bytes.toString("utf8"));
  }
}

export async function verifyModel(directory) {
  const model = await readJson(path.join(directory, "model.json"));
  assert.equal(model.format, MODEL_FORMAT);
  assert.equal(model.version, 3);
  assert.ok(typeof model.id === "string" && model.id.length > 0);
  assert.match(model.repository?.revision ?? "", REVISION);
  // The publisher reads each claimed file at the revision and records its digest in the delivery.
  const claims = (model.components ?? []).flatMap((component) => component.files ?? []);
  assert.ok(claims.length > 0, "the model claims no files");
  // The publisher names a view's plate, panel and viewer by its own title, and sets its summary beside its figure.
  for (const view of model.views ?? []) {
    const title = typeof view.title === "string" ? view.title.trim() : "";
    assert.ok(title && title !== model.title, `view ${view.id} has no title of its own`);
    const summary = typeof view.summary === "string" ? view.summary.trim() : "";
    assert.ok(summary, `view ${view.id} has no summary`);
  }
  return model.id;
}

/** Whether a guide's directory, which may hold regular files only, holds its draft. */
async function holdsDraft(directory, draft) {
  const names = [];
  for (const entry of await readdir(directory, { withFileTypes: true })) {
    assert.ok(entry.isFile(), `${entry.name} in the guide's directory is not a regular file`);
    names.push(entry.name);
  }
  return names.includes(draft);
}

/**
 * The files a model's directory holds: the given files, the overview composition the model names and the directory of
 * the guide it names, which may hold regular files only. Returns the file names and the directories it did not claim.
 */
async function modelFiles(directory, model, files, kind) {
  const { overview, guide } = model;
  // A model may name its overview composition, which the work then holds beside it.
  assert.ok(
    overview === undefined || (typeof overview === "string" && COMPOSITION.test(overview)),
    `the overview ${overview} is not a Typst file beside the model`,
  );
  // A model may name its guide, which the work then holds in a directory of its own.
  assert.ok(
    guide === undefined || (typeof guide === "string" && GUIDE.test(guide)),
    `the guide ${guide} is not an Archify draft in a directory of its own`,
  );
  const [guideDirectory, draft] = guide ? guide.split("/") : [];
  const allowed = new Set([...files, ...(overview ? [overview] : [])]);
  const names = [];
  const others = [];
  let guideHeld = false;
  for (const entry of await readdir(directory, { withFileTypes: true })) {
    if (entry.isDirectory() && entry.name === guideDirectory) {
      guideHeld = await holdsDraft(path.join(directory, entry.name), draft);
      continue;
    }
    if (entry.isDirectory() && kind === "work" && LOCALES.has(entry.name)) {
      others.push(entry.name);
      continue;
    }
    assert.ok(entry.isFile() && allowed.has(entry.name), `${entry.name} is not a ${kind} file`);
    names.push(entry.name);
  }
  assert.ok(!overview || names.includes(overview), `the overview ${overview} is missing`);
  assert.ok(!guide || guideHeld, `the guide ${guide} is missing`);
  return { names, translations: others };
}

/**
 * A work's translation: a model in the directory's locale that translates the work's model, pinned to its revision,
 * with the table that fixes each term's rendering.
 */
export async function verifyTranslation(directory, original) {
  const locale = path.basename(directory);
  const model = await readJson(path.join(directory, "model.json"));
  assert.equal(model.locale, locale, `${locale} holds a ${model.locale} model`);
  assert.equal(model.id, original.id, `${locale} translates ${model.id}, not ${original.id}`);
  const [pinned, work] = [model.repository?.revision, original.repository?.revision];
  assert.equal(pinned, work, `${locale} pins ${pinned}, not the work's ${work}`);
  const { names } = await modelFiles(directory, model, TRANSLATION_FILES, "translation");
  assert.ok(names.includes("concepts.md"), `${locale} holds no concepts.md`);
  return verifyModel(directory);
}

export async function verifyWork(directory, repositoryRoot) {
  const model = await readJson(path.join(directory, "model.json"));
  const { names, translations } = await modelFiles(directory, model, WORK_FILES, "work");
  assert.ok(names.includes("README.md") && names.includes("model.json"));
  if (names.includes("source.json")) await verifyCustody(directory, repositoryRoot);
  const id = await verifyModel(directory);
  for (const locale of translations) await verifyTranslation(path.join(directory, locale), model);
  return id;
}

export async function verifyPublications(publications, repositoryRoot) {
  const works = new Map();
  for (const entry of await readdir(publications, { withFileTypes: true })) {
    assert.ok(entry.isDirectory(), `${entry.name} is not a work directory`);
    const id = await verifyWork(path.join(publications, entry.name), repositoryRoot);
    assert.ok(!works.has(id), `${entry.name} and ${works.get(id)} both publish ${id}`);
    works.set(id, entry.name);
  }
  return works;
}
