## Why

The repository declares and runs ETHOS 0.2.0-beta.5. The owner asked that every governed
repository run the latest ETHOS release, and that every supply chain move to its latest stable
release without a separate confirmation. 0.2.0-beta.6 publishes its own Mise declaration, whose
platform checksums equal the release's `SHA256SUMS` and the published asset digests.

Its adopter-facing changes since 0.2.0-beta.5 are these:

- **The publication declaration names no peer coordinate and no command that ETHOS does not run.**
  `.ethos/release.toml` no longer takes `forge_repository` in a peer, nor
  `local_verification_command` and `local_installation_command`; the loader refuses each, and
  `ethos lane repair-paradigm --apply` removes them without echoing their values. This repository
  declares GitHub's `forge_repository` and both command fields.
- Review observation resolves a peer's web repository from the clone's local
  `remote.<name>.forgeRepository`, else from an `http` or `https` remote without userinfo. Both
  remotes are SSH, so each peer needs the local key; the clone held GitLab's, and this move
  records GitHub's.
- Result schema 3 bounds large results and gives `next` its final vocabulary. A retirement receipt
  applies only with `--retire`, which the dry run's continuation carries.
- A rollback across the repaired declaration refuses until the predecessor's declaration is restored
  in a lane.

## What Changes

- Replace the 0.2.0-beta.5 declaration in `.config/mise/config.toml` with the declaration published
  with 0.2.0-beta.6, unchanged, and lock it again with native `mise lock` from Mise 2026.10.25, the
  release that the hosted jobs run, so the lock keeps its format.
- Bind the repository family to the 0.2.0-beta.6 runtime through the locked console's
  `hook install`, keeping the 0.2.0-beta.5 runtime as the rollback.
- Remove GitHub's `forge_repository` and the two command fields from `.ethos/release.toml` with the
  deterministic paradigm repair, and record GitHub's web repository in the clone's local
  `remote.github.forgeRepository`, because its SSH remote leaves it unresolved otherwise.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. The publications, their checks and their publication behave as before, so `.openspec.yaml`
sets `skip_specs: true`.

## Impact

`.config/mise/config.toml`, `.config/mise/mise.lock`, `.ethos/release.toml` and the
repository-common runtime selection. The CI projection, the hosted jobs' Mise
and the Node release stay as they are. `tasks.md` is the sole progress ledger.
