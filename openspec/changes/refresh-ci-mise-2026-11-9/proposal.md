## Why

The hosted GitHub job installs Mise 2026.11.8, while 2026.11.9 has been the latest stable release
since 16 November 2026. The owner directed on 18 November 2026 that every governed repository take
the latest stable release of its supply.

## What Changes

- Run the hosted GitHub job with Mise 2026.11.9 from `[supply] mise_version`.
- Generate both pipelines again from the common model.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. The publications, their checks and their publication behave as before, so `.openspec.yaml`
sets `skip_specs: true`.

## Impact

`.config/ci/verification.toml` and the generated `.github/workflows/ci.yml`. GitLab's macOS jobs use
the Mise their guest provides, so the generated `.gitlab-ci.yml` stays as it is. The lockfile stays
at version 3, and the Mise floor and the Node release stay as they are. `tasks.md` is the sole
progress ledger.
