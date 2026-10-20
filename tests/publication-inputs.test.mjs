import assert from "node:assert/strict";
import { execFileSync } from "node:child_process";
import { createHash } from "node:crypto";
import { mkdtemp, mkdir, readFile, readdir, rm, writeFile } from "node:fs/promises";
import os from "node:os";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { test } from "node:test";
import { verifyPublicationInput } from "../tools/verification/publication-inputs.mjs";

const root = fileURLToPath(new URL("../", import.meta.url));
const publications = path.join(root, "publications");
const sha256 = (bytes) => createHash("sha256").update(bytes).digest("hex");

for (const entry of await readdir(publications, { withFileTypes: true })) {
  if (!entry.isDirectory()) continue;
  test(`${entry.name}: current data and Git-retained originals keep exact custody`, async () => {
    await verifyPublicationInput(path.join(publications, entry.name), root);
  });
}

async function withFixture(run) {
  const directory = await mkdtemp(path.join(os.tmpdir(), "publication-inputs-"));
  const git = (...args) =>
    execFileSync("git", args, {
      cwd: directory,
      timeout: 10000,
      stdio: ["ignore", "pipe", "pipe"],
    })
      .toString("utf8")
      .trim();
  try {
    const body = Buffer.from(JSON.stringify({ schema: "architecture.claim-model/v2" }));
    await writeFile(path.join(directory, "model.json"), body);
    git("init", "--quiet");
    git("add", "--", "model.json");
    git(
      "-c",
      "core.hooksPath=",
      "-c",
      "commit.gpgsign=false",
      "-c",
      "user.name=Fixture",
      "-c",
      "user.email=fixture@example.invalid",
      "commit",
      "--quiet",
      "-m",
      "original input",
    );
    const source = {
      sourceCommit: git("rev-parse", "HEAD"),
      sourceTree: git("rev-parse", "HEAD^{tree}"),
      preservationCommit: git("rev-parse", "HEAD"),
      members: [
        { source: "model.json", target: "model.json", bytes: body.length, sha256: sha256(body) },
      ],
    };
    await writeFile(path.join(directory, "source.json"), JSON.stringify(source));
    await run({ directory, source });
  } finally {
    await rm(directory, { recursive: true, force: true });
  }
}

test("input custody refuses corrupt identity, escaping paths and unsupported storage", async () => {
  await withFixture(async ({ directory, source }) => {
    for (const mutate of [
      (copy) => {
        copy.sourceCommit = "unbound";
      },
      (copy) => {
        copy.members.push({ ...copy.members[0] });
      },
      (copy) => {
        copy.members[0].target = "../outside.json";
      },
      (copy) => {
        copy.members[0].storage = "runtime";
      },
      (copy) => {
        copy.members[0].bytes += 1;
      },
      (copy) => {
        copy.members[0].sha256 = "0".repeat(64);
      },
    ]) {
      const copy = structuredClone(source);
      mutate(copy);
      await writeFile(path.join(directory, "source.json"), JSON.stringify(copy));
      await assert.rejects(verifyPublicationInput(directory, directory), assert.AssertionError);
    }
  });
});

test("direct input refuses a Provider and an unpinned model without changing source bytes", async () => {
  await withFixture(async ({ directory }) => {
    await mkdir(path.join(directory, "edition"));
    await writeFile(
      path.join(directory, "edition/project.json"),
      JSON.stringify({
        schema: "architecture.edition-project/v1",
        questions: ["What does this system do?"],
      }),
    );
    const before = await readFile(path.join(directory, "model.json"));
    const request = {
      schema: "architecture.build-request/v1",
      edition: { kind: "direct", root: "edition", manifest: "project.json" },
      providers: [],
      media: ["static", "interactive"],
      sources: [{ input: { kind: "pin", path: "model.json", sha256: sha256(before) } }],
    };
    await writeFile(path.join(directory, "build-request.json"), JSON.stringify(request));
    await verifyPublicationInput(directory, directory);
    for (const mutate of [
      (copy) => {
        copy.providers = ["source-owned-exporter"];
      },
      (copy) => {
        copy.sources[0].input.sha256 = "0".repeat(64);
      },
    ]) {
      const copy = structuredClone(request);
      mutate(copy);
      await writeFile(path.join(directory, "build-request.json"), JSON.stringify(copy));
      await assert.rejects(verifyPublicationInput(directory, directory), assert.AssertionError);
    }
    assert.deepEqual(await readFile(path.join(directory, "model.json")), before);
  });
});
