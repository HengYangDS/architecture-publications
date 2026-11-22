import assert from "node:assert/strict";
import { test } from "node:test";
import { verifyModel } from "../tools/verification/publication-inputs.mjs";
import { model, withDirectory, writeModel } from "./fixtures/works.mjs";

const repository = { name: "shop", url: "https://github.com/o/shop.git", revision: "a".repeat(40) };
const refused = /the browse template its GitHub or GitLab address implies/;

test("a work on GitHub or GitLab states its address once, and one elsewhere may state its template", async () => {
  await withDirectory(async (directory) => {
    await writeModel(directory, { ...model("shop"), repository });
    assert.equal(await verifyModel(directory), "shop");
    for (const [url, browse] of [
      ["https://github.com/o/shop.git", "https://github.com/o/shop/blob/{revision}/{path}"],
      ["https://GitLab.com/g/shop", "https://gitlab.com/g/shop/-/blob/{revision}/{path}"],
    ]) {
      await writeModel(directory, { ...model("shop"), repository: { ...repository, url, browse } });
      await assert.rejects(verifyModel(directory), refused, url);
    }
    const elsewhere = {
      ...repository,
      url: "https://git.example.invalid/o/shop",
      browse: "https://git.example.invalid/o/shop/src/{revision}/{path}",
    };
    await writeModel(directory, { ...model("shop"), repository: elsewhere });
    assert.equal(await verifyModel(directory), "shop");
  });
});
