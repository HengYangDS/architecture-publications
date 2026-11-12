## Why

Each work follows its repository's latest release. ETHOS has released 0.2.0-beta.8 and AIGW 0.7.0, and their
works still pin 0.2.0-beta.6 and v0.6.1. Both releases restructure their sources: ETHOS adds an application layer
and an operation catalog between its surfaces and its domain, and AIGW renames its product model to providers,
models, families and client selections.

## What Changes

- The ETHOS work pins v0.2.0-beta.8 in both languages. Its components claim the application layer, a new
  operation catalog component declares and runs each command, the CLI's relations to the components it no longer
  imports are replaced by the catalog's, and the npm launcher is gone.
- The AIGW work pins v0.7.0 in both languages, in its new vocabulary: providers, models named `provider/model`,
  families and client selections. The renaming workflow is gone, the catalog lifecycle and the check depths
  replace the route lifecycle and the checked states, and the commands are 0.7.0's.
- Each work's README, term table, scope and overview name the new pin, and `CHANGELOG.md` records the moves.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every claim and citation at the new pins.

## Impact

`publications/ethos/` and `publications/aigw-client/`: the models, overviews, guides, READMEs and term tables;
`CHANGELOG.md`. The described repositories are unchanged.
