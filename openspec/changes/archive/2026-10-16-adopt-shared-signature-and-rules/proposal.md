# Change: Adopt The Shared Signature And OpenSpec Rules

## Why

ETHOS now requires an SSH signature on every commit in every governed
repository and owns that rule in its repository paradigm. The
`signing_required` and `signing_format` fields that this repository restates in
`[commit_policy]` are therefore reported as restated declarations. The paradigm
also requires every OpenSpec configuration to begin its artifact rules with the
common rules. Under the current runtime the paradigm report names both gaps, and
proof blocks until they are repaired.

## What Changes

- Switch this repository's hooks to the ETHOS runtime that holds the shared
  signature rule.
- Delete the restated signing fields with ETHOS's native
  `ethos lane repair-paradigm --apply`, which also removes the emptied
  `.ethos/workspace.toml`.
- Add the paradigm's common OpenSpec rules to `openspec/config.yaml` with the
  same repair.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. Publication behavior is unchanged, so `.openspec.yaml` sets
`skip_specs: true`.

## Impact

`.ethos/workspace.toml` is removed and `openspec/config.yaml` gains the common
rules. Commits stay SSH-signed, as they already are. `tasks.md` is the sole
progress ledger.
