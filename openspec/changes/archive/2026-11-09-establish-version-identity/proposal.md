## Why

The owner requires every ETHOS-governed repository to carry a version identity. This repository
publishes six works to both Forges but has no `VERSION`, no changelog and no declared release tags.

## What Changes

- Add `VERSION` with `0.1.0` as the repository's only version source.
- Add `CHANGELOG.md` in Keep a Changelog 1.1.0 form, with an `[Unreleased]` section and a
  `[0.1.0] - 2026-11-09` section that records what the repository already holds.
- Declare release tags in `.ethos/release.toml` as `[protected_refs] tags = ["v*"]`.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. The works, their checks and their publication behave as before, so `.openspec.yaml` sets
`skip_specs: true`.

## Impact

`VERSION`, `CHANGELOG.md` and `.ethos/release.toml`. No tag or Forge release is created; tagging
the first release is a separate decision of the owner. `tasks.md` is the sole progress ledger.
