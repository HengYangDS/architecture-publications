## Why

The cover of an edition sets a work's title large, then its question, then its summary. The Change
`settle-the-covers-and-two-names` made each summary open with what the work does, after the owner found the name
repeated (「首页中，仓库名称有过多重复，几个句子都以其开头」). Each Chinese question still opens with the work's name,
directly under the title that names it: 「ETHOS」, then 「ETHOS 怎样……」. The English questions open with "How", their
subject standing inside the sentence.

## What Changes

- The six Chinese questions open with 怎样 or 如何, the name left to the title above them. Each asks what it asked.
- The input check refuses a question that opens with the work's name, as it refuses a summary.

No pin moves, no English text changes, and no citation changes.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: a work's question, like its summary, does not open with its name.

## Impact

`publications/*/zh/model.json`: six questions. `tools/verification/publication-inputs.mjs` and
`tests/publication-inputs.test.mjs`: the rule and its test. `CHANGELOG.md`. The six Chinese editions are rebuilt.
