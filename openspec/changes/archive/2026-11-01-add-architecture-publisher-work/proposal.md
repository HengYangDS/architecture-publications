## Why

Architecture Publisher's own architecture model lives inside the publisher's
repository, in `editions/self/`. A general publisher keeps no publication
inputs of its own. A model stored in the repository it describes can also only
pin an earlier commit of that repository, so it always lags behind. The model
belongs here with the other works, where it pins a read-only checkout like they
do.

## What Changes

- Add the work `publications/architecture-publisher/`: its model, copied from
  Architecture Publisher at dev `009e84c` with one change, an attribution that
  names this repository as its editor like the other works, and a README in
  the form of the other works.
- The input check expects three works, and the repository README lists the new
  one.

No other work changes.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. The publication-input requirements already apply to every work; this
Change adds one under them.

## Impact

`publications/architecture-publisher/`, `tests/publication-inputs.test.mjs` and
`README.md`. Architecture Publisher removes `editions/self/` in its own Change
once this work has landed. Pinning the model to a newer revision of Architecture
Publisher is out of scope.
