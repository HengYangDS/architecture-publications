import assert from "node:assert/strict";
import { execFileSync } from "node:child_process";
import { createHash } from "node:crypto";
import { readFile, readdir } from "node:fs/promises";
import path from "node:path";

const MODEL_FORMAT = "architecture-publisher.model";
const WORK_FILES = new Set(["README.md", "model.json", "source.json"]);
const REVISION = /^([0-9a-f]{40}|[0-9a-f]{64})$/;
const DIGEST = /^[0-9a-f]{64}$/;

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
  assert.equal(model.version, 1);
  assert.ok(typeof model.id === "string" && model.id.length > 0);
  assert.match(model.repository?.revision ?? "", REVISION);
  const sources = Object.entries(model.sources ?? {});
  assert.ok(sources.length > 0, "the model cites no sources");
  for (const [id, source] of sources) {
    assert.match(source.sha256 ?? "", DIGEST, `source ${id} declares no digest`);
  }
  // The publisher names a view's poster, panel and viewer by its own title.
  for (const view of model.views ?? []) {
    const title = typeof view.title === "string" ? view.title.trim() : "";
    assert.ok(title && title !== model.title, `view ${view.id} has no title of its own`);
  }
  return model.id;
}

export async function verifyWork(directory, repositoryRoot) {
  const names = [];
  for (const entry of await readdir(directory, { withFileTypes: true })) {
    assert.ok(entry.isFile() && WORK_FILES.has(entry.name), `${entry.name} is not a work file`);
    names.push(entry.name);
  }
  assert.ok(names.includes("README.md") && names.includes("model.json"));
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
