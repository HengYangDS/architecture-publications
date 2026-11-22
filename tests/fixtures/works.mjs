import { mkdir, mkdtemp, rm, writeFile } from "node:fs/promises";
import os from "node:os";
import path from "node:path";

/** A minimal valid model of one work, in the given locale. */
export const model = (id, locale = "en") => ({
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

/** Run with a fresh temporary directory, removed afterwards. */
export async function withDirectory(run) {
  const directory = await mkdtemp(path.join(os.tmpdir(), "publication-inputs-"));
  try {
    await run(directory);
  } finally {
    await rm(directory, { recursive: true, force: true });
  }
}

/** Write a model into the given directory. */
export async function writeModel(directory, body) {
  await mkdir(directory, { recursive: true });
  await writeFile(path.join(directory, "model.json"), JSON.stringify(body));
}
