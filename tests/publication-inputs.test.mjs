import assert from "node:assert/strict";
import { execFileSync } from "node:child_process";
import { createHash } from "node:crypto";
import { mkdtemp, mkdir, rename, rm, symlink, writeFile } from "node:fs/promises";
import os from "node:os";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { test } from "node:test";
import {
  opensWithName,
  verifyCustody,
  verifyModel,
  verifyPublications,
  verifyQuestionTable,
  verifyWork,
} from "../tools/verification/publication-inputs.mjs";
import { model, withDirectory, writeModel } from "./fixtures/works.mjs";

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

const chinese = { ...model("shop", "zh-CN"), title: "商店" };

/** A work's README, headed by its title and naming the revision it pins. */
const readme = (title = "Shop", revision = "a".repeat(40)) =>
  `# ${title}\n\nThe model pins \`shop\` at \`${revision}\`.\n`;
/** A work's term table, headed by its title and naming its revision's first seven characters. */
const termTable = (title = "Shop", revision = "a".repeat(40)) =>
  `# ${title}: term renderings\n\nSources are the files at \`${revision.slice(0, 7)}\`.\n\n| English | 中文 | Source |\n`;

/** Write a work: its README and, for each language, the model in that language's directory. */
async function writeWork(directory, languages = { en: model("shop") }) {
  await mkdir(directory, { recursive: true });
  await writeFile(path.join(directory, "README.md"), readme());
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
      overview: { blocks: [{ title: "Orders", items: [], view: "overview" }] },
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

test("a work's question and summary do not open with its name, which the cover sets above them", async () => {
  assert.equal(opensWithName("ETHOS compiles a plan.", "ETHOS"), true);
  assert.equal(opensWithName("Film Kit narrates each edition.", "Film Kit"), true);
  assert.equal(opensWithName("AIGW 把配置放在一个文件里。", "AIGW 统一客户端配置"), true);
  assert.equal(opensWithName("数据部门工作指南把读者引到规则。", "数据部门工作指南"), true);
  assert.equal(opensWithName("Each effect is admitted on a pass.", "ETHOS"), false);
  assert.equal(opensWithName("Filmmakers read it.", "Film Kit"), false);
  await withDirectory(async (directory) => {
    const work = { ...model("shop"), summary: "Shop takes orders." };
    await writeModel(directory, work);
    await assert.rejects(verifyModel(directory), /the summary opens with the work's name/);
    Object.assign(work, { summary: "Orders reach the warehouse.", question: "Shop 怎样送货？" });
    await writeModel(directory, work);
    await assert.rejects(verifyModel(directory), /the question opens with the work's name/);
  });
});

test("every view carries a summary", async () => {
  await withDirectory(async (directory) => {
    const summarised = {
      ...model("shop"),
      overview: { blocks: [{ title: "Orders", items: [], view: "overview" }] },
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
    await writeFile(path.join(directory, "concepts.md"), termTable());
    await assert.rejects(
      verifyWork(directory, directory),
      /a work in one language holds concepts\.md/,
    );
    await rm(path.join(directory, "concepts.md"));
    await rm(path.join(directory, "README.md"));
    await assert.rejects(verifyWork(directory, directory), /the work holds no README\.md/);
    await writeFile(path.join(directory, "README.md"), readme());
    await rm(path.join(directory, "en"), { recursive: true });
    await assert.rejects(verifyWork(directory, directory), /the work holds no language/);
  });
});

test("a work's README is headed by its title and names its pin", async () => {
  await withDirectory(async (directory) => {
    await writeWork(directory);
    assert.equal(await verifyWork(directory, directory), "shop");
    for (const [body, refusal] of [
      [readme("shop"), /README\.md is not headed "# Shop"/u],
      [readme("Shop", "b".repeat(40)), /README\.md does not name the pinned revision a{40}/u],
      [readme("Shop", "a".repeat(7)), /README\.md does not name the pinned revision a{40}/u],
    ]) {
      await writeFile(path.join(directory, "README.md"), body);
      await assert.rejects(verifyWork(directory, directory), refusal);
    }
  });
});

test("a work's term table is headed by its title and names its pin", async () => {
  await withDirectory(async (directory) => {
    await writeWork(directory, { en: model("shop"), zh: chinese });
    await writeFile(path.join(directory, "concepts.md"), termTable());
    assert.equal(await verifyWork(directory, directory), "shop");
    for (const [body, refusal] of [
      [
        termTable("Shop").replace(": term renderings", " concepts"),
        /concepts\.md is not headed "# Shop: term renderings"/u,
      ],
      [termTable("商店"), /concepts\.md is not headed "# Shop: term renderings"/u],
      [
        termTable("Shop", "b".repeat(40)),
        /concepts\.md does not name the pinned revision aaaaaaa/u,
      ],
    ]) {
      await writeFile(path.join(directory, "concepts.md"), body);
      await assert.rejects(verifyWork(directory, directory), refusal);
    }
  });
});

/** An overview's statement: a claim, a course of two steps with a line between them, and one list. */
const statement = (words) => ({
  claim: words[0],
  course: {
    steps: [
      { id: "order", label: words[1], view: "orders" },
      { id: "ship", label: words[2] },
    ],
    lines: [{ from: "ship", to: ["order"], label: words[3] }],
  },
  blocks: [{ title: words[4], items: [[words[5], words[6]]] }],
});
const stated = statement(["Orders", "Order", "Ship", "again", "Terms", "order", "a request"]);
const statedInChinese = statement(["订单", "下单", "发货", "再来", "术语", "订单", "一项请求"]);

test("a work states its overview in its model, and holds no composition", async () => {
  await withDirectory(async (directory) => {
    const english = path.join(directory, "en");
    await writeWork(directory, { en: { ...model("shop"), overview: stated } });
    assert.equal(await verifyWork(directory, directory), "shop");
    // A composition beside the model is no work file, whether or not the model names it.
    await writeFile(path.join(english, "overview.typ"), '#import "/archpub/house.typ": *\n');
    await assert.rejects(verifyWork(directory, directory), /en\/overview\.typ is not a work file/);
    await writeModel(english, { ...model("shop"), overview: "overview.typ" });
    await assert.rejects(
      verifyWork(directory, directory),
      /the overview overview\.typ names a composition, which the publisher retired/,
    );
    await rm(path.join(english, "overview.typ"));
    for (const overview of [3, null, ["a claim"]]) {
      await writeModel(english, { ...model("shop"), overview });
      await assert.rejects(
        verifyWork(directory, directory),
        /the overview is not a statement in the model/,
      );
    }
  });
});

test("the languages of a work state one overview, in other words", async () => {
  await withDirectory(async (directory) => {
    const write = (zh) =>
      writeWork(directory, {
        en: { ...model("shop"), overview: stated },
        zh: { ...chinese, overview: zh },
      });
    await writeFile(path.join(directory, "concepts.md"), termTable());
    await write(statedInChinese);
    assert.equal(await verifyWork(directory, directory), "shop");
    // Another identifier, a reference that one language lacks, and a list of another length.
    const renamed = structuredClone(statedInChinese);
    renamed.course.steps[1].id = "send";
    await write(renamed);
    await assert.rejects(
      verifyWork(directory, directory),
      /zh states another overview than en at \/overview\/course\/steps\/1\/id/,
    );
    const unlinked = structuredClone(statedInChinese);
    delete unlinked.course.steps[0].view;
    await write(unlinked);
    await assert.rejects(
      verifyWork(directory, directory),
      /zh states another overview than en at \/overview\/course\/steps\/0\/view/,
    );
    const longer = structuredClone(statedInChinese);
    longer.blocks[0].items.push(["发货", "一次发货"]);
    await write(longer);
    await assert.rejects(
      verifyWork(directory, directory),
      /zh states another overview than en at \/overview\/blocks\/0\/items/,
    );
    await write(undefined);
    await assert.rejects(
      verifyWork(directory, directory),
      /zh states another overview than en at \/overview/,
    );
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
    await writeFile(path.join(directory, "concepts.md"), termTable());
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
        env: Object.fromEntries(
          Object.entries(process.env).filter(([name]) => !name.startsWith("GIT_")),
        ),
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

test("the question table holds entries with a unique id, a lens, the roles that ask and a question", async (t) => {
  const table = path.join(root, "questions/question-table.json");
  const entries = await verifyQuestionTable(table);
  assert.ok(entries.length > 0);
  const source = JSON.parse(await (await import("node:fs/promises")).readFile(table, "utf8"));
  const directory = await mkdtemp(path.join(os.tmpdir(), "publications-questions-"));
  t.after(() => rm(directory, { recursive: true, force: true }));
  for (const [mutate, message] of [
    [(copy) => copy.entries.push({ ...copy.entries[0] }), /named twice/u],
    [(copy) => (copy.entries[0].asks = []), /no role asks/u],
    [(copy) => (copy.entries[0].lens = "style"), /lens/u],
    [(copy) => (copy.entries[0].question = " "), /question/u],
    [(copy) => (copy.entries[0].asks = ["reviewer"]), /role/u],
  ]) {
    const copy = structuredClone(source);
    mutate(copy);
    const file = path.join(directory, "table.json");
    await writeFile(file, JSON.stringify(copy));
    await assert.rejects(verifyQuestionTable(file), message);
  }
});

test("a work's Chinese text names roles, not kinds of holder", async () => {
  const { readdir, readFile } = await import("node:fs/promises");
  const presumes = /人员|审阅人/u;
  const found = [];
  const works = path.join(root, "publications");
  for (const work of await readdir(works, { withFileTypes: true })) {
    if (!work.isDirectory()) continue;
    const files = [path.join(works, work.name, "concepts.md")];
    const chinese = path.join(works, work.name, "zh");
    for (const entry of await readdir(chinese, { withFileTypes: true, recursive: true }).catch(
      () => [],
    ))
      if (entry.isFile()) files.push(path.join(entry.parentPath, entry.name));
    for (const file of files) {
      const text = await readFile(file, "utf8").catch(() => "");
      for (const [index, line] of text.split("\n").entries())
        if (presumes.test(line)) found.push(`${path.relative(root, file)}:${index + 1}`);
    }
  }
  assert.deepEqual(found, []);
});
