## Why

The repository declares Node 26.13.0 in its Mise configuration and Prettier 3.9.10 in its npm
manifest. Node 26.13.1, published on 11 November 2026, is a security release with nine High-severity
fixes, and Prettier 3.10.1 is the latest stable release of the formatter the repository's own format
check runs. The owner's standing direction moves every supply chain to its latest stable release,
and the owner approved landing these two moves on 15 November 2026.

## What Changes

- Declare Node 26.13.1 in `.config/mise/config.toml` and lock it again with native `mise lock`; the
  lock stays at version 3.
- Move Prettier to 3.10.1 in `package.json` and resolve `package-lock.json` again with npm.
- Record both moves in the Changelog.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. The publications, their checks and their publication behave as before, so `.openspec.yaml`
sets `skip_specs: true`.

## Impact

`.config/mise/config.toml`, `.config/mise/mise.lock`, `package.json`, `package-lock.json` and
`CHANGELOG.md`. Prettier 3.10.1 reformats no file of the repository with its configuration, so no
file under `trials/` or `questions/` changes. The ETHOS binding, the CI pipelines and the works stay
as they are. `tasks.md` is the sole progress ledger.
