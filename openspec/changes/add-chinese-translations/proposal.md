## Why

On 9 November the owner received Chinese editions and pages of all six works, built with Architecture Publisher
0.10.1 beside the English ones. Their sources, a Chinese model, overview, guide and term table per work, exist only
in an ignored build directory. Preparing them showed three faults in the English works:

- The filmkit guide cites line 80 of the README for the off-centre states, which v0.16.0 moved to line 82.
- The AIGW model says the credential helper serves a Token "never on standard output"; it writes the Token to
  standard output and never writes a diagnostic there.
- The Architecture Publisher work describes v0.10.0, and v0.10.1 was released on 8 November.

## What Changes

- Each work holds its Chinese translation in `zh-CN/`: the model in `zh-CN` with the same id and revision, its
  overview, its guide and `concepts.md`, the table that fixes each term's rendering with its source.
- The input check admits a translation directory named by the model's locale and refuses one whose model names
  another locale, id or revision, or that has no term table.
- The three English faults are corrected, and the Architecture Publisher work moves to v0.10.1.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: a work may hold its translations.

## Impact

`publications/*/zh-CN/`, `publications/filmkit/guide/guide.archify.md`, `publications/aigw-client/model.json`,
`publications/architecture-publisher/`, `tools/verification/publication-inputs.mjs`, its test, `README.md` and
`openspec/specs/publication-inputs/spec.md`.
