import assert from 'node:assert/strict';
import { createHash } from 'node:crypto';
import { readFile, readdir } from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { test } from 'node:test';

const root = fileURLToPath(new URL('../', import.meta.url));
const publications = path.join(root, 'publications');
const sha256 = (bytes) => createHash('sha256').update(bytes).digest('hex');
const readJson = async (file) => JSON.parse(await readFile(file, 'utf8'));

for (const entry of await readdir(publications, { withFileTypes: true })) {
  if (!entry.isDirectory()) continue;
  const directory = path.join(publications, entry.name);

  test(`${entry.name}: publication inputs retain exact pinned members`, async () => {
    const source = await readJson(path.join(directory, 'source.json'));
    assert.match(source.sourceCommit, /^[a-f0-9]{40}$/);
    assert.match(source.sourceTree, /^[a-f0-9]{40}$/);
    assert.ok(Array.isArray(source.members) && source.members.length > 0);
    const targets = new Set();
    for (const member of source.members) {
      assert.ok(typeof member.source === 'string' && member.source.length > 0);
      assert.ok(typeof member.target === 'string' && member.target.length > 0);
      const file = path.resolve(directory, member.target);
      assert.ok(file.startsWith(`${directory}${path.sep}`));
      assert.ok(!targets.has(file));
      targets.add(file);
      const bytes = await readFile(file);
      assert.equal(bytes.length, member.bytes);
      assert.equal(sha256(bytes), member.sha256);
      if (file.endsWith('.json')) JSON.parse(bytes.toString('utf8'));
    }
  });

  if (!(await readdir(directory)).includes('build-request.json')) continue;
  test(`${entry.name}: direct publication consumes local data only`, async () => {
    const request = await readJson(path.join(directory, 'build-request.json'));
    assert.equal(request.schema, 'architecture.build-request/v1');
    assert.equal(request.edition.kind, 'direct');
    assert.deepEqual(request.providers, []);
    const projectFile = path.resolve(directory, request.edition.root, request.edition.manifest);
    assert.ok(projectFile.startsWith(`${directory}${path.sep}`));
    const project = await readJson(projectFile);
    assert.equal(project.schema, 'architecture.edition-project/v1');
    assert.ok(project.questions.length > 0);
    assert.deepEqual(request.media, ['static', 'interactive']);
    for (const source of request.sources) {
      assert.equal(source.input.kind, 'pin');
      const file = path.resolve(directory, source.input.path);
      assert.ok(file.startsWith(`${directory}${path.sep}`));
      const bytes = await readFile(file);
      assert.equal(sha256(bytes), source.input.sha256);
      assert.equal(JSON.parse(bytes.toString('utf8')).schema, 'architecture.claim-model/v2');
    }
  });
}
