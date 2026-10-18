# Change: Expose The Common Toolchain Verbs

## Why

The ETHOS repository paradigm requires each repository's toolchain owner to
expose the common `bootstrap`, `check` and `fix` verbs. `package.json` owns this
repository's toolchain, and the paradigm report names all three verbs as
missing. The formatting gate also runs whichever Prettier and taplo the host
provides on its `PATH`, so a repository checkout does not select its own
formatters.

## What Changes

- Switch this repository's hooks to the current ETHOS runtime.
- Lock Prettier and taplo as development dependencies at the versions the
  ETHOS fleet locks, with `package-lock.json` kept out of Prettier's inputs as
  npm's own output.
- Add `bootstrap`, `check` and `fix` scripts to `package.json` that run the
  native install, check and format commands.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. Publication behavior is unchanged, so `.openspec.yaml` sets
`skip_specs: true`.

## Impact

`package.json` gains the three scripts and two development dependencies, and
`package-lock.json` is tracked. The formatting gate and the input tests keep
their commands. `tasks.md` is the sole progress ledger.
