import assert from "node:assert/strict";
import { execFileSync } from "node:child_process";
import { createHash } from "node:crypto";
import { mkdtemp, mkdir, rm, symlink, writeFile } from "node:fs/promises";
import os from "node:os";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { test } from "node:test";
import {
  verifyCustody,
  verifyModel,
  verifyPublications,
  verifyWork,
} from "../tools/verification/publication-inputs.mjs";

const root = fileURLToPath(new URL("../", import.meta.url));
const sha256 = (bytes) => createHash("sha256").update(bytes).digest("hex");

test("every work is one pinned model with verified custody and a unique id", async () => {
  const works = await verifyPublications(path.join(root, "publications"), root);
  assert.deepEqual([...works.values()].sort(), [
    "aigw-client",
    "architecture-publisher",
    "ddwg",
    "ethos",
    "filmkit",
    "openai-responses-proxy",
  ]);
});

const model = (id) => ({
  format: "architecture-publisher.model",
  version: 3,
  id,
  title: "Shop",
  question: "How does an order reach the warehouse?",
  repository: { name: "shop", revision: "a".repeat(40) },
  components: [{ id: "orders", label: "Orders", files: ["orders.go"] }],
  relations: [],
});

async function withDirectory(run) {
  const directory = await mkdtemp(path.join(os.tmpdir(), "publication-inputs-"));
  try {
    await run(directory);
  } finally {
    await rm(directory, { recursive: true, force: true });
  }
}

async function writeWork(directory, body = model("shop")) {
  await mkdir(directory, { recursive: true });
  await writeFile(path.join(directory, "README.md"), "# Shop\n");
  await writeFile(path.join(directory, "model.json"), JSON.stringify(body));
}

test("a model is refused unless it is the publisher's format pinned exactly", async () => {
  await withDirectory(async (directory) => {
    await writeWork(directory);
    assert.equal(await verifyModel(directory), "shop");
    for (const mutate of [
      (copy) => {
        copy.format = "architecture.claim-model/v2";
      },
      (copy) => {
        copy.version = 2;
      },
      (copy) => {
        copy.repository.revision = "a".repeat(7);
      },
      (copy) => {
        delete copy.repository;
      },
      (copy) => {
        copy.components[0].files = [];
      },
      (copy) => {
        delete copy.components[0].files;
      },
    ]) {
      const copy = structuredClone(model("shop"));
      mutate(copy);
      await writeWork(directory, copy);
      await assert.rejects(verifyModel(directory), assert.AssertionError);
    }
  });
});

test("every view is named by a title of its own", async () => {
  await withDirectory(async (directory) => {
    const titled = {
      ...model("shop"),
      views: [{ id: "overview", title: "Overview", question: "What is in the shop?" }],
    };
    await writeWork(directory, titled);
    assert.equal(await verifyModel(directory), "shop");
    for (const title of [undefined, " ", "Shop"]) {
      const copy = structuredClone(titled);
      copy.views[0].title = title;
      await writeWork(directory, copy);
      await assert.rejects(verifyModel(directory), /view overview has no title of its own/);
    }
  });
});

test("a work holds only its model, description and custody record", async () => {
  await withDirectory(async (directory) => {
    await writeWork(directory);
    assert.equal(await verifyWork(directory, directory), "shop");
    await writeFile(path.join(directory, "build-request.json"), "{}");
    await assert.rejects(
      verifyWork(directory, directory),
      /build-request\.json is not a work file/,
    );
    await rm(path.join(directory, "build-request.json"));
    await rm(path.join(directory, "README.md"));
    await assert.rejects(verifyWork(directory, directory), assert.AssertionError);
  });
});

test("a work may hold the overview composition its model names", async () => {
  await withDirectory(async (directory) => {
    await writeWork(directory, { ...model("shop"), overview: "overview.typ" });
    await assert.rejects(verifyWork(directory, directory), /the overview overview\.typ is missing/);
    await writeFile(path.join(directory, "overview.typ"), '#import "/archpub/house.typ": *\n');
    assert.equal(await verifyWork(directory, directory), "shop");
    await writeWork(directory, model("shop"));
    await assert.rejects(verifyWork(directory, directory), /overview\.typ is not a work file/);
    for (const overview of ["../overview.typ", "pages/overview.typ", "overview.svg", 3]) {
      await writeWork(directory, { ...model("shop"), overview });
      await assert.rejects(
        verifyWork(directory, directory),
        /is not a Typst file beside the model/,
      );
    }
  });
});

test("a work may hold the guide its model names in a directory of its own", async () => {
  await withDirectory(async (directory) => {
    const guided = { ...model("shop"), guide: "guide/guide.archify.md" };
    const missing = /the guide guide\/guide\.archify\.md is missing/;
    const guideDirectory = path.join(directory, "guide");
    await writeWork(directory, guided);
    await assert.rejects(verifyWork(directory, directory), missing);
    await mkdir(guideDirectory);
    await writeFile(path.join(guideDirectory, "parts.architecture.json"), "{}\n");
    await assert.rejects(verifyWork(directory, directory), missing);
    await writeFile(path.join(guideDirectory, "guide.archify.md"), "# Shop {#shop}\n");
    assert.equal(await verifyWork(directory, directory), "shop");
    await mkdir(path.join(guideDirectory, "parts"));
    await assert.rejects(
      verifyWork(directory, directory),
      /parts in the guide's directory is not a regular file/,
    );
    await rm(path.join(guideDirectory, "parts"), { recursive: true });
    await symlink("parts.architecture.json", path.join(guideDirectory, "link.json"));
    await assert.rejects(
      verifyWork(directory, directory),
      /link\.json in the guide's directory is not a regular file/,
    );
    await rm(path.join(guideDirectory, "link.json"));
    await writeWork(directory, model("shop"));
    await assert.rejects(verifyWork(directory, directory), /guide is not a work file/);
    for (const guide of [
      "guide.archify.md",
      "../guide/guide.archify.md",
      "./guide/guide.archify.md",
      "guide/parts/guide.archify.md",
      "guide/guide.md",
      "guide/.archify.md",
      3,
    ]) {
      await writeWork(directory, { ...model("shop"), guide });
      await assert.rejects(
        verifyWork(directory, directory),
        /is not an Archify draft in a directory of its own/,
      );
    }
  });
});

test("a work may hold a translation in its locale, bound to its id and revision", async () => {
  await withDirectory(async (directory) => {
    await writeWork(directory);
    const translation = path.join(directory, "zh-CN");
    const chinese = { ...model("shop"), locale: "zh-CN", title: "商店" };
    await mkdir(translation);
    await writeFile(path.join(translation, "model.json"), JSON.stringify(chinese));
    await assert.rejects(verifyWork(directory, directory), /zh-CN holds no concepts\.md/);
    await writeFile(path.join(translation, "concepts.md"), "| English | 中文 | Source |\n");
    assert.equal(await verifyWork(directory, directory), "shop");
    for (const [change, refusal] of [
      [{ locale: "es" }, /zh-CN holds a es model/],
      [{ id: "store" }, /zh-CN translates store, not shop/],
      [
        { repository: { name: "shop", revision: "b".repeat(40) } },
        /zh-CN pins b{40}, not the work's a{40}/,
      ],
    ]) {
      await writeFile(
        path.join(translation, "model.json"),
        JSON.stringify({ ...chinese, ...change }),
      );
      await assert.rejects(verifyWork(directory, directory), refusal);
    }
    await writeFile(path.join(translation, "model.json"), JSON.stringify(chinese));
    await writeFile(path.join(translation, "README.md"), "# 商店\n");
    await assert.rejects(verifyWork(directory, directory), /README\.md is not a translation file/);
    await rm(path.join(translation, "README.md"));
    await mkdir(path.join(directory, "fr-XX"));
    await assert.rejects(verifyWork(directory, directory), /fr-XX is not a work file/);
  });
});

test("two works may not publish under one id", async () => {
  await withDirectory(async (directory) => {
    await writeWork(path.join(directory, "first"));
    await writeWork(path.join(directory, "second"));
    await assert.rejects(
      verifyPublications(directory, directory),
      /second and first both publish shop/,
    );
  });
});

test("custody refuses corrupt identity, escaping paths and unsupported storage", async () => {
  await withDirectory(async (directory) => {
    const git = (...args) =>
      execFileSync("git", args, {
        cwd: directory,
        timeout: 10000,
        stdio: ["ignore", "pipe", "pipe"],
      })
        .toString("utf8")
        .trim();
    const body = Buffer.from(JSON.stringify({ schema: "architecture.claim-model/v2" }));
    await writeFile(path.join(directory, "original.json"), body);
    git("init", "--quiet");
    git("add", "--", "original.json");
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
    const local = { source: "original.json", target: "original.json", bytes: body.length };
    const source = {
      sourceCommit: git("rev-parse", "HEAD"),
      sourceTree: git("rev-parse", "HEAD^{tree}"),
      preservationCommit: git("rev-parse", "HEAD"),
      members: [{ ...local, sha256: sha256(body) }],
    };
    await writeFile(path.join(directory, "source.json"), JSON.stringify(source));
    await verifyCustody(directory, directory);
    await rm(path.join(directory, "original.json"));
    source.members[0].storage = "git";
    await writeFile(path.join(directory, "source.json"), JSON.stringify(source));
    await verifyCustody(directory, directory);
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
      (copy) => {
        delete copy.members[0].storage;
      },
    ]) {
      const copy = structuredClone(source);
      mutate(copy);
      await writeFile(path.join(directory, "source.json"), JSON.stringify(copy));
      await assert.rejects(verifyCustody(directory, directory));
    }
  });
});
