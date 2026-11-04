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
  assert.equal(model.version, 2);
  assert.ok(typeof model.id === "string" && model.id.length > 0);
  assert.match(model.repository?.revision ?? "", REVISION);
  // The publisher reads each claimed file at the revision and records its digest in the delivery.
  const claims = (model.components ?? []).flatMap((component) => component.files ?? []);
  assert.ok(claims.length > 0, "the model claims no files");
  // The publisher names a view's poster, panel and viewer by its own title.
  for (const view of model.views ?? []) {
    const title = typeof view.title === "string" ? view.title.trim() : "";
    assert.ok(title && title !== model.title, `view ${view.id} has no title of its own`);
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

export async function verifyWork(directory, repositoryRoot) {
  const { overview, guide } = await readJson(path.join(directory, "model.json"));
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
  const allowed = new Set([...WORK_FILES, ...(overview ? [overview] : [])]);
  const names = [];
  let guideHeld = false;
  for (const entry of await readdir(directory, { withFileTypes: true })) {
    if (entry.isDirectory() && entry.name === guideDirectory) {
      guideHeld = await holdsDraft(path.join(directory, entry.name), draft);
      continue;
    }
    assert.ok(entry.isFile() && allowed.has(entry.name), `${entry.name} is not a work file`);
    names.push(entry.name);
  }
  assert.ok(names.includes("README.md") && names.includes("model.json"));
  assert.ok(!overview || names.includes(overview), `the overview ${overview} is missing`);
  assert.ok(!guide || guideHeld, `the guide ${guide} is missing`);
  if (names.includes("source.json")) await verifyCustody(directory, repositoryRoot);
  return verifyModel(directory);
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
