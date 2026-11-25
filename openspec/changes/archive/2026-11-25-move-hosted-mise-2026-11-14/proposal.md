## Why

The hosted GitHub job installs Mise 2026.11.11. Mise 2026.11.14, published on 24 November 2026 at 11:00
UTC, is the latest stable release, and it passed the 24-hour release age on 25 November 2026. On
26 November 2026 the owner asked that Mise be at its latest stable release everywhere, and the CI
macOS guest's Mise moved to 2026.11.14 the same morning.

## What Changes

- Run the hosted GitHub job with Mise 2026.11.14 from `[supply] mise_version`, as the GitLab jobs
  already do.
- Generate the pipelines again from the common model.
- Record the move in the Changelog's Unreleased section, where the earlier move is recorded.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. The repository's checks and its publication behave as before, so `.openspec.yaml` sets
`skip_specs: true`.

## Impact

`.config/ci/verification.toml`, the generated GitHub workflow and `CHANGELOG.md`. The lockfile
stays at version 3, and the Mise floor stays as it is. `tasks.md` is the sole progress ledger.
