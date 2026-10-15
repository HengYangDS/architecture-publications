# Change: Adopt The ETHOS Repository Paradigm

## Why

ETHOS now holds every governed repository to one repository paradigm: shared
text normalization, one formatter binding per text carrier class at the
paradigm's settings, and configuration grouped under `.config/<group>/<owner>/`.
The current paradigm report finds six gaps here: the two text-normalization
carriers, the Prettier and taplo bindings, and the two Prettier files that sit
directly under `.config/checks/`. The hooks also bound an outdated ETHOS
runtime that refused write admission, so they moved to the current runtime
before this Change, and the migration lands under it.

## What Changes

- Add `.gitattributes` and `.editorconfig` with the paradigm's text
  normalization.
- Move the Prettier configuration to `.config/checks/prettier/prettier.toml`
  and its ignore file to `.config/checks/prettier/prettierignore`, keeping the
  current settings and exclusions.
- Bind taplo at `.config/checks/taplo/taplo.toml` with the paradigm's column
  width and format the TOML files.
- Make `npm run format:check` and `npm run format:fix` run both formatters, let
  the `formatting` gate run the check verb, and point the README at the verbs.
- Record the switch of this repository's hooks to the current ETHOS runtime.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. Publication inputs and their verification are unchanged, so
`.openspec.yaml` sets `skip_specs: true`.

## Impact

`.gitattributes`, `.editorconfig`, the `.config/checks/` carriers,
`package.json`, `.ethos/profile.toml`, the formatting of `.ethos/workspace.toml`
and `README.md` change. Publication inputs, captured source originals, tests
and the verification tool do not change. The private package still installs no
dependencies: taplo runs from the host's Homebrew installation, as Prettier
already does. `tasks.md` is the sole progress ledger.
