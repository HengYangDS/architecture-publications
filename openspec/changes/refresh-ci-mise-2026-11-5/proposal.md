## Why

The hosted GitHub job installs Mise 2026.11.4, while 2026.11.5 has been the latest stable release
since 9 November 2026. The owner's standing direction moves every supply chain to its latest stable
release that is at least a day old.

## What Changes

- Run the hosted GitHub job with Mise 2026.11.5 from `[supply] mise_version`.
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
