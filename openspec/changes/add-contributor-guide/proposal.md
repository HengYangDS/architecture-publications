## Why

The repository has an agent entry and a reader entry but no contributor guide. A contributor has to
piece together how to add or change a work, which checks apply and who accepts a delivery from the
README, the input checks and the ETHOS lane workflow. The next ETHOS release, 0.2.0-alpha.26,
requires a root `CONTRIBUTING.md` in every governed repository (`paradigm-root-rules`), so without
one the repository would gain a paradigm gap when it moves to that release.

## What Changes

- Add `CONTRIBUTING.md` at the root. It states what a contribution here is (one Architecture Model
  per work, with its README and an optional `source.json`), how a model is checked against the
  described repository, how deliveries are reviewed and accepted outside this repository, the local
  checks and formatters, and the ETHOS lane workflow a change follows.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. The publication inputs and their checks are unchanged, so `.openspec.yaml` sets
`skip_specs: true`.

## Impact

One new root document. No work, model, test or tool changes. The repository has no forge, so the
change lands on the local accepted branch only. `tasks.md` is the sole progress ledger.
