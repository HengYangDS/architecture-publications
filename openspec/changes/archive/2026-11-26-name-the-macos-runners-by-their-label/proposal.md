## Why

The GitLab macOS jobs select their runners by the hosts' former tags, `ci-macos-arm64-review` and
`ci-macos-arm64-shell`. The fleet names a runner by the label its jobs ask for, `macos-latest`, and its role, as the
publisher's jobs have done since its release 0.20.0. The publications' runners carry the new tags beside the
former ones, and the former can be dropped once no job selects them.

## What Changes

- `[gitlab.runners.macos]` in `.config/ci/verification.toml` selects `macos-latest` with `review` for a review
  job and with `protected` for a protected one.
- The GitLab pipeline is generated again from the common model.
- The Changelog's Unreleased section records the move.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. The jobs and their checks are the same, so `.openspec.yaml` sets `skip_specs: true`.

## Impact

`.config/ci/verification.toml`, the generated `.gitlab-ci.yml` and `CHANGELOG.md`.
