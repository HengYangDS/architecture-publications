# Proposal

## Why

`package.json` declares no `name`, so npm names the root package after the directory that holds
it and writes that name into the lock. `package-lock.json` reads `"name": "20261018-toolchain-verbs"`,
the Work Lane that last wrote it, and the next lock refresh from another checkout rewrites the
field. The lock then changes with the checkout path rather than with the dependencies.

## What Changes

- Declare `"name": "architecture-publications"` in `package.json`.
- Regenerate `package-lock.json` with npm, so that only its root package name changes.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. Publication behavior is unchanged, so `.openspec.yaml` sets `skip_specs: true`.

## Impact

`package.json` gains one field and `package-lock.json` changes only its root name. Prettier 3.9.10
and `@taplo/cli` 0.7.0 are already the newest stable releases, so no dependency changes.
`tasks.md` is the sole progress ledger.
