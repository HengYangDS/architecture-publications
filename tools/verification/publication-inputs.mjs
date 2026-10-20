import assert from "node:assert/strict";
import { execFileSync } from "node:child_process";
import { createHash } from "node:crypto";
import { readFile, readdir } from "node:fs/promises";
import path from "node:path";

const sha256 = (bytes) => createHash("sha256").update(bytes).digest("hex");
const readJson = async (file) => JSON.parse(await readFile(file, "utf8"));
const localFile = (directory, relative) => {
  assert.ok(typeof relative === "string" && relative.length > 0);
  const file = path.resolve(directory, relative);
  assert.ok(file.startsWith(`${directory}${path.sep}`));
  return file;
};

export async function verifyPublicationInput(directory, repositoryRoot) {
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

  if (!(await readdir(directory)).includes("build-request.json")) return;
  const request = await readJson(path.join(directory, "build-request.json"));
  assert.equal(request.schema, "architecture.build-request/v1");
  assert.equal(request.edition.kind, "direct");
  assert.deepEqual(request.providers, []);
  const projectFile = localFile(
    directory,
    path.join(request.edition.root, request.edition.manifest),
  );
  const project = await readJson(projectFile);
  assert.equal(project.schema, "architecture.edition-project/v1");
  assert.ok(project.questions.length > 0);
  assert.deepEqual(request.media, ["static", "interactive"]);
  for (const selected of request.sources) {
    assert.equal(selected.input.kind, "pin");
    const file = localFile(directory, selected.input.path);
    const bytes = await readFile(file);
    assert.equal(sha256(bytes), selected.input.sha256);
    assert.equal(JSON.parse(bytes.toString("utf8")).schema, "architecture.claim-model/v2");
  }
}
