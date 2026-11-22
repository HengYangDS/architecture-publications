## Why

Architecture Publisher's queue item `edition-map` reads the landscape edition as one map: every view is reached from
the overview. Its census of the editions 0.16.0 builds (2026-11-21) found four views that their work's overview names
nowhere, so a reader finds those plates only in the contents: ETHOS's `status` and `runtime`, and the first view of
AIGW Client and of Film Kit (`overview`). The publisher only warns of it (`overview_view_unreached`).

## What Changes

- ETHOS's lane step gains a station Status, between Start and Prewrite, which names the view `status`; a short block
  on the runtime every hook runs names the view `runtime`. It does not repeat `runtime/CURRENT`, which the structure
  block already lists.
- AIGW Client's block "What the operator does" and Film Kit's step "Package" name their works' first view; no words
  change.
- Each in both languages.
- The input check refuses a view that its overview names nowhere. Its test stands in
  `tests/publication-overview.test.mjs`; the model, directory and writer the test files share move to
  `tests/fixtures/works.mjs`, and `npm test` runs every test file.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: every view is reached from its work's overview.

## Impact

Changed: six models (`publications/{ethos,aigw-client,filmkit}/{en,zh}/model.json`),
`tools/verification/publication-inputs.mjs`, `tests/publication-inputs.test.mjs`, `package.json`,
`.gitattributes` and `CHANGELOG.md`. New: `tests/publication-overview.test.mjs` and `tests/fixtures/works.mjs`. Built with Architecture
Publisher 0.16.0, the six editions build with no overview warning, and the line measures read as before (ETHOS's
Chinese overview checked by eye: the station and the block fit).
