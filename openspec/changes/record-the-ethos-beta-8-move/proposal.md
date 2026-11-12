## Why

The repository moved its checks from ETHOS 0.2.0-beta.6 to 0.2.0-beta.8 in this lane, through
`rebind-ethos-beta-7` and `rebind-ethos-beta-8`, but `CHANGELOG.md` does not say so; a reader of the
next release would not learn which ETHOS checks the works. The lane also changed holder: its Lease
moved by `ethos lane handoff transfer` from the session that bound it to the session that lands it,
and a proof made under the earlier Lease generation no longer admits a landing, so the landing needs
a head proven under the current one.

## What Changes

- Record under `Unreleased` in `CHANGELOG.md` that the repository's checks run on ETHOS
  0.2.0-beta.8.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. The publications, their checks and their publication behave as before, so `.openspec.yaml`
sets `skip_specs: true`.

## Impact

`CHANGELOG.md` only. `tasks.md` is the sole progress ledger.
