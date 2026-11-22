import assert from "node:assert/strict";
import { test } from "node:test";
import { verifyModel } from "../tools/verification/publication-inputs.mjs";
import { model, withDirectory, writeModel } from "./fixtures/works.mjs";

const refused = /the overview names no element for view/;
const withViews = (overview) => ({
  ...model("shop"),
  views: [
    {
      id: "orders",
      title: "How an order moves",
      summary: "Orders reach the warehouse.",
      members: ["orders"],
    },
    {
      id: "stock",
      title: "What the stock holds",
      summary: "Stock answers for each item.",
      members: ["orders"],
    },
  ],
  overview,
});

test("every view a work declares is named by an element of its overview", async () => {
  await withDirectory(async (directory) => {
    const reached = {
      claim: "Orders reach the warehouse",
      course: { steps: [{ id: "order", label: "Order", view: "orders" }] },
      blocks: [{ title: "Stock", items: [["Count", "one per item"]], view: "stock" }],
    };
    await writeModel(directory, withViews(reached));
    assert.equal(await verifyModel(directory), "shop");
    const unreached = {
      ...reached,
      blocks: [{ title: "Stock", items: [["Count", "one per item"]] }],
    };
    await writeModel(directory, withViews(unreached));
    await assert.rejects(verifyModel(directory), refused);
    await writeModel(directory, { ...model("shop") });
    assert.equal(await verifyModel(directory), "shop");
  });
});
