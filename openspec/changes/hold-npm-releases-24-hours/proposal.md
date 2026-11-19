## Why

The owner directed on 19 November 2026 that every governed repository hold third-party releases for
24 hours, and that each repository write that age in its own configuration rather than inherit it
from the host. This repository declares Mise's age since `hold-third-party-supply-24-hours`, but
npm still reads the age of whichever host runs it, from that user's `~/.npmrc`.

## What Changes

- Add `.config/npm/npmrc` holding `min-release-age=1`, npm's age in days.
- Point npm at it under `[env]` in `.config/mise/config.toml`: `NPM_CONFIG_USERCONFIG` names the
  file, and the lower-case alias `npm_config_userconfig` is removed.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. The publications, their checks and their publication behave as before, so `.openspec.yaml`
sets `skip_specs: true`.

## Impact

`.config/npm/npmrc` and `.config/mise/config.toml` only. npm's release age filters a version that
it has to resolve, not one that `package-lock.json` names, so `npm ci` installs the locked packages
as before. The lockfile, the npm packages and the generated pipelines stay as they are. `tasks.md`
is the sole progress ledger.
