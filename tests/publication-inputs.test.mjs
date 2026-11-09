import assert from "node:assert/strict";
import { execFileSync } from "node:child_process";
import { createHash } from "node:crypto";
import { mkdtemp, mkdir, rename, rm, symlink, writeFile } from "node:fs/promises";
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

const model = (id, locale = "en") => ({
  format: "architecture-publisher.model",
  version: 3,
  id,
  locale,
  title: "Shop",
  question: "How does an order reach the warehouse?",
  repository: { name: "shop", revision: "a".repeat(40) },
  components: [{ id: "orders", label: "Orders", files: ["orders.go"] }],
  relations: [],
});
const chinese = { ...model("shop", "zh-CN"), title: "商店" };

async function withDirectory(run) {
  const directory = await mkdtemp(path.join(os.tmpdir(), "publication-inputs-"));
  try {
    await run(directory);
  } finally {
    await rm(directory, { recursive: true, force: true });
  }
}

/** Write a model into the given directory. */
async function writeModel(directory, body) {
  await mkdir(directory, { recursive: true });
  await writeFile(path.join(directory, "model.json"), JSON.stringify(body));
}

/** Write a work: its README and, for each language, the model in that language's directory. */
async function writeWork(directory, languages = { en: model("shop") }) {
  await mkdir(directory, { recursive: true });
  await writeFile(path.join(directory, "README.md"), "# Shop\n");
  for (const [language, body] of Object.entries(languages))
    await writeModel(path.join(directory, language), body);
}

test("a model is refused unless it is the publisher's format pinned exactly", async () => {
  await withDirectory(async (directory) => {
    await writeModel(directory, model("shop"));
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
      await writeModel(directory, copy);
      await assert.rejects(verifyModel(directory), assert.AssertionError);
    }
  });
});

test("every view is named by a title of its own", async () => {
  await withDirectory(async (directory) => {
    const titled = {
      ...model("shop"),
      views: [
        {
          id: "overview",
          title: "Overview",
          question: "What is in the shop?",
          summary: "Orders reach the warehouse.",
        },
      ],
    };
    await writeModel(directory, titled);
    assert.equal(await verifyModel(directory), "shop");
    for (const title of [undefined, " ", "Shop"]) {
      const copy = structuredClone(titled);
      copy.views[0].title = title;
      await writeModel(directory, copy);
      await assert.rejects(verifyModel(directory), /view overview has no title of its own/);
    }
  });
});

test("every view carries a summary", async () => {
  await withDirectory(async (directory) => {
    const summarised = {
      ...model("shop"),
      views: [
        {
          id: "overview",
          title: "Overview",
          question: "What is in the shop?",
          summary: "Orders reach the warehouse.",
        },
      ],
    };
    await writeModel(directory, summarised);
    assert.equal(await verifyModel(directory), "shop");
    for (const summary of [undefined, " ", 7]) {
      const copy = structuredClone(summarised);
      copy.views[0].summary = summary;
      await writeModel(directory, copy);
      await assert.rejects(verifyModel(directory), /view overview has no summary/);
    }
  });
});

test("a work holds only its languages, description, custody record and term table", async () => {
  await withDirectory(async (directory) => {
    await writeWork(directory);
    assert.equal(await verifyWork(directory, directory), "shop");
    for (const name of ["build-request.json", "model.json"]) {
      await writeFile(path.join(directory, name), "{}");
      await assert.rejects(
        verifyWork(directory, directory),
        new RegExp(`: ${name.replace(".", "\\.")} is not a work file`),
      );
      await rm(path.join(directory, name));
    }
    await writeFile(path.join(directory, "concepts.md"), "| English | 中文 | Source |\n");
    await assert.rejects(
      verifyWork(directory, directory),
      /a work in one language holds concepts\.md/,
    );
    await rm(path.join(directory, "concepts.md"));
    await rm(path.join(directory, "README.md"));
    await assert.rejects(verifyWork(directory, directory), /the work holds no README\.md/);
    await writeFile(path.join(directory, "README.md"), "# Shop\n");
    await rm(path.join(directory, "en"), { recursive: true });
    await assert.rejects(verifyWork(directory, directory), /the work holds no language/);
  });
});

test("a work may hold the overview composition its model names", async () => {
  await withDirectory(async (directory) => {
    const english = path.join(directory, "en");
    await writeWork(directory, { en: { ...model("shop"), overview: "overview.typ" } });
    await assert.rejects(
      verifyWork(directory, directory),
      /en: the overview overview\.typ is missing/,
    );
    await writeFile(path.join(english, "overview.typ"), '#import "/archpub/house.typ": *\n');
    assert.equal(await verifyWork(directory, directory), "shop");
    await writeModel(english, model("shop"));
    await assert.rejects(verifyWork(directory, directory), /en\/overview\.typ is not a work file/);
    for (const overview of ["../overview.typ", "pages/overview.typ", "overview.svg", 3]) {
      await writeModel(english, { ...model("shop"), overview });
      await assert.rejects(
        verifyWork(directory, directory),
        /is not a Typst file beside the model/,
      );
    }
  });
});

test("a work may hold the guide its model names in a directory of its own", async () => {
  await withDirectory(async (directory) => {
    const english = path.join(directory, "en");
    const guided = { ...model("shop"), guide: "guide/guide.archify.md" };
    const missing = /en: the guide guide\/guide\.archify\.md is missing/;
    const guideDirectory = path.join(english, "guide");
    await writeWork(directory, { en: guided });
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
    await writeModel(english, model("shop"));
    await assert.rejects(verifyWork(directory, directory), /en\/guide is not a work file/);
    for (const guide of [
      "guide.archify.md",
      "../guide/guide.archify.md",
      "./guide/guide.archify.md",
      "guide/parts/guide.archify.md",
      "guide/guide.md",
      "guide/.archify.md",
      3,
    ]) {
      await writeModel(english, { ...model("shop"), guide });
      await assert.rejects(
        verifyWork(directory, directory),
        /is not an Archify draft in a directory of its own/,
      );
    }
  });
});

test("a work holds each language in a directory named by its model's language, with the same files", async () => {
  await withDirectory(async (directory) => {
    const [english, zh] = [path.join(directory, "en"), path.join(directory, "zh")];
    const guided = (body) => ({ ...body, guide: "guide/guide.archify.md" });
    await writeWork(directory, { en: guided(model("shop")), zh: guided(chinese) });
    for (const language of [english, zh]) {
      await mkdir(path.join(language, "guide"));
      await writeFile(path.join(language, "guide", "guide.archify.md"), "# Shop {#shop}\n");
      await writeFile(path.join(language, "guide", "parts.architecture.json"), "{}\n");
    }
    await assert.rejects(
      verifyWork(directory, directory),
      /a work in more than one language holds no concepts\.md/,
    );
    await writeFile(path.join(directory, "concepts.md"), "| English | 中文 | Source |\n");
    assert.equal(await verifyWork(directory, directory), "shop");
    await rm(path.join(zh, "guide", "parts.architecture.json"));
    await assert.rejects(
      verifyWork(directory, directory),
      /zh lacks guide\/parts\.architecture\.json, which en holds/,
    );
    await writeFile(path.join(zh, "guide", "parts.architecture.json"), "{}\n");
    await writeFile(path.join(zh, "guide", "steps.workflow.json"), "{}\n");
    await assert.rejects(
      verifyWork(directory, directory),
      /zh holds guide\/steps\.workflow\.json, which en lacks/,
    );
    await rm(path.join(zh, "guide", "steps.workflow.json"));
    for (const [change, refusal] of [
      [{ locale: "en" }, /zh holds an en model/],
      [{ locale: undefined }, /zh\/model\.json names no locale the publisher reads/],
      [{ locale: "fr-FR" }, /zh\/model\.json names no locale the publisher reads/],
      [{ id: "store" }, /zh holds store, not en's shop/],
      [{ repository: { name: "shop", revision: "b".repeat(40) } }, /zh pins b{40}, not en's a{40}/],
    ]) {
      await writeModel(zh, { ...guided(chinese), ...change });
      await assert.rejects(verifyWork(directory, directory), refusal);
    }
    await writeModel(zh, guided(chinese));
    await rename(zh, path.join(directory, "zh-CN"));
    await assert.rejects(verifyWork(directory, directory), /: zh-CN is not a work file/);
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
