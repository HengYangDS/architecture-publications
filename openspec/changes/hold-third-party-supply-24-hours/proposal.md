## Why

The owner directed on 19 November 2026 that every governed repository hold third-party releases for
24 hours, and that each repository write that age in its own configuration rather than inherit it
from the host. This repository writes none today, so Mise reads the age of whichever host runs it.

## What Changes

- Declare `minimum_release_age = "24h"` under `[settings]` in `.config/mise/config.toml`.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. The publications, their checks and their publication behave as before, so `.openspec.yaml`
sets `skip_specs: true`.

## Impact

`.config/mise/config.toml` only. Mise's release age filters a version that it has to resolve, not
one that a lockfile or an exact declaration names, so the locked Node release and the hosted jobs
install as before. The lockfile, the npm packages and the generated pipelines stay as they are.
`tasks.md` is the sole progress ledger.
