import assert from "node:assert/strict";
import { execFileSync } from "node:child_process";
import { createHash } from "node:crypto";
import { readFile, readdir } from "node:fs/promises";
import path from "node:path";

const MODEL_FORMAT = "architecture-publisher.model";
/** What a work holds beside its language directories: its description, custody record and term table. */
const WORK_FILES = new Set(["README.md", "source.json", "concepts.md"]);
/** An overview composition the publisher typesets: one Typst file beside the model. */
const COMPOSITION = /^[^/\\]+\.typ$/;
/** A guide the publisher delivers as the page: an Archify draft in a directory of its own. */
const GUIDE = /^(?!\.\.?\/)[^/\\]+\/[^/\\]+\.archify\.md$/;
const REVISION = /^([0-9a-f]{40}|[0-9a-f]{64})$/;
/** The locales the publisher reads. */
const LOCALES = new Set(["en", "zh-CN", "zh-TW", "es", "ko"]);
/** A locale's language, which names the directory that holds a work's model in that locale. */
const languageOf = (locale) => locale.split("-")[0];
const LANGUAGES = new Set([...LOCALES].map(languageOf));

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
 * The files a language directory holds: its model, the overview composition the model names and the directory of the
 * guide it names, which may hold regular files only.
 */
async function modelFiles(directory, model, language) {
  const { overview, guide } = model;
  // A model may name its overview composition, which its directory then holds beside it.
  assert.ok(
    overview === undefined || (typeof overview === "string" && COMPOSITION.test(overview)),
    `the overview ${overview} is not a Typst file beside the model`,
  );
  // A model may name its guide, which its directory then holds in a directory of its own.
  assert.ok(
    guide === undefined || (typeof guide === "string" && GUIDE.test(guide)),
    `the guide ${guide} is not an Archify draft in a directory of its own`,
  );
  const [guideDirectory, draft] = guide ? guide.split("/") : [];
  const allowed = new Set(["model.json", ...(overview ? [overview] : [])]);
  const names = [];
  let guideHeld = false;
  for (const entry of await readdir(directory, { withFileTypes: true })) {
    if (entry.isDirectory() && entry.name === guideDirectory) {
      guideHeld = await holdsDraft(path.join(directory, entry.name), draft);
      continue;
    }
    assert.ok(
      entry.isFile() && allowed.has(entry.name),
      `${language}/${entry.name} is not a work file`,
    );
    names.push(entry.name);
  }
  assert.ok(
    !overview || names.includes(overview),
    `${language}: the overview ${overview} is missing`,
  );
  assert.ok(!guide || guideHeld, `${language}: the guide ${guide} is missing`);
}

/** Every file below a directory, as sorted paths relative to it. */
async function filesBelow(directory) {
  const entries = await readdir(directory, { recursive: true, withFileTypes: true });
  return entries
    .filter((entry) => entry.isFile())
    .map((entry) =>
      path.relative(directory, path.join(entry.parentPath, entry.name)).split(path.sep).join("/"),
    )
    .sort();
}

/** One language of a work: a model that names a locale of that language, and the files its directory holds. */
async function verifyLanguage(directory, language) {
  const model = await readJson(path.join(directory, "model.json"));
  assert.ok(
    LOCALES.has(model.locale),
    `${language}/model.json names no locale the publisher reads`,
  );
  const article = /^[aeiou]/u.test(model.locale) ? "an" : "a";
  assert.equal(
    languageOf(model.locale),
    language,
    `${language} holds ${article} ${model.locale} model`,
  );
  await modelFiles(directory, model, language);
  await verifyModel(directory);
  return { model, files: await filesBelow(directory) };
}

/**
 * A work's README and term table name its subject and pin: the README opens with the model's title and names the full
 * revision, and the term table opens with that title and "term renderings" and names the revision's first seven
 * characters, so a new pin that leaves either behind is refused.
 */
async function verifyNaming(directory, model, concepts) {
  const { title } = model;
  const revision = model.repository.revision;
  const opening = async (name) => (await readFile(path.join(directory, name), "utf8")).split("\n");
  const [readmeHeading, ...readme] = await opening("README.md");
  assert.equal(readmeHeading, `# ${title}`, `README.md is not headed "# ${title}"`);
  assert.ok(
    readme.join("\n").includes(revision),
    `README.md does not name the pinned revision ${revision}`,
  );
  if (!concepts) return;
  const [tableHeading, ...table] = await opening("concepts.md");
  const heading = `# ${title}: term renderings`;
  assert.equal(tableHeading, heading, `concepts.md is not headed "${heading}"`);
  assert.ok(
    table.join("\n").includes(revision.slice(0, 7)),
    `concepts.md does not name the pinned revision ${revision.slice(0, 7)}`,
  );
}

/**
 * A work: each of its languages in a directory named by that language, every one with the same files and a model of
 * one id and revision, beside its README, an optional custody record and, in more than one language, its term table.
 */
export async function verifyWork(directory, repositoryRoot) {
  const names = [];
  const languages = [];
  for (const entry of await readdir(directory, { withFileTypes: true })) {
    if (entry.isDirectory() && LANGUAGES.has(entry.name)) {
      languages.push(entry.name);
      continue;
    }
    assert.ok(entry.isFile() && WORK_FILES.has(entry.name), `${entry.name} is not a work file`);
    names.push(entry.name);
  }
  assert.ok(names.includes("README.md"), "the work holds no README.md");
  assert.ok(languages.length > 0, "the work holds no language");
  const concepts = names.includes("concepts.md");
  assert.ok(languages.length > 1 || !concepts, "a work in one language holds concepts.md");
  assert.ok(
    languages.length < 2 || concepts,
    "a work in more than one language holds no concepts.md",
  );
  if (names.includes("source.json")) await verifyCustody(directory, repositoryRoot);
  const [first, ...others] = languages.sort();
  const reference = await verifyLanguage(path.join(directory, first), first);
  for (const language of others) {
    const { model, files } = await verifyLanguage(path.join(directory, language), language);
    assert.equal(
      model.id,
      reference.model.id,
      `${language} holds ${model.id}, not ${first}'s ${reference.model.id}`,
    );
    const [pinned, pin] = [model.repository?.revision, reference.model.repository?.revision];
    assert.equal(pinned, pin, `${language} pins ${pinned}, not ${first}'s ${pin}`);
    const missing = reference.files.find((file) => !files.includes(file));
    assert.ok(!missing, `${language} lacks ${missing}, which ${first} holds`);
    const extra = files.find((file) => !reference.files.includes(file));
    assert.ok(!extra, `${language} holds ${extra}, which ${first} lacks`);
  }
  // The README and the term table are written in English, which sorts first among the languages, so they name the
  // first language's title: the English one whenever the work has it.
  await verifyNaming(directory, reference.model, concepts);
  return reference.model.id;
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
