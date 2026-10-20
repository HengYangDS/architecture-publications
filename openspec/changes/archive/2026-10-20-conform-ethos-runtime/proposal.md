# Proposal

## Why

The ETHOS runtime built from `66044eba5` adds two checks that the current tree fails:

- The source format gate renders authored JavaScript with the shared ETHOS Prettier policy and
  with this repository's `.config/checks/prettier/prettier.toml` as its increment, and refuses a
  file whose two renderings differ. The increment sets `singleQuote = true`, which the shared
  policy does not, so `tests/publication-inputs.test.mjs` and
  `tools/verification/publication-inputs.mjs` report `native_formatter_policy_conflict`.
- The prose gate now also runs the shared Vale policy, whose term rule reports the product name
  Taplo written in lowercase twice in `README.md`.

## What Changes

- Drop `singleQuote` from the repository Prettier increment, so that the shared policy decides
  quoting, and format the two JavaScript files with `ethos lane format`.
- Spell the product name Taplo in `README.md`.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. Publication behavior is unchanged, so `.openspec.yaml` sets `skip_specs: true`.

## Impact

The Prettier increment loses one setting, the two JavaScript files change only their string
quotes, and `README.md` two words. No file changed here is bound by a digest, and the captured
source originals keep their bytes behind the Prettier ignore file. Binding the ETHOS runtime is a
local hook installation, not a tracked change. Changing a publication or its input tests is out of
scope. `tasks.md` is the sole progress ledger.
