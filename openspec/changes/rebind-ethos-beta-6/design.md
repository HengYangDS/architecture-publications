## Context

See [proposal.md](proposal.md). 0.2.0-beta.6 and 0.2.0-beta.5 each refuse the other's publication
declaration, so the move follows ETHOS's successor-first adopter cutover: bind the release in the
lane, repair the declaration there, prove, publish the proposal from the lane, then land and
publish from the canonical root. The hosted jobs run Mise 2026.10.25, which
`.config/ci/verification.toml` pins.

## Goals / Non-Goals

**Goals:**

- Run every gate and lifecycle command of the family, locally and in the hosted macOS jobs, on
  0.2.0-beta.6.
- Keep the 0.2.0-beta.5 runtime as the rollback until the landing is accepted.

**Non-Goals:**

- Changing any gate, check, publication, runner declaration, the hosted jobs' Mise, the Node
  release or the CI projection.

## Decisions

- Copy the release's own declaration unchanged and lock it with the official Mise 2026.10.25
  binary, whose digest equals its release asset, after checking each platform checksum against the
  release's `SHA256SUMS` and the published asset digests. The lock keeps `lockfile_version = 3`.
- Remove the retired fields only through `ethos lane repair-paradigm --apply`, so no value is
  echoed and the repair is the paradigm's own.
- Record GitHub's public web repository in the local `remote.github.forgeRepository`, the native
  key that review observation reads for an SSH remote, only if the peer is reported unresolved; it
  stays untracked.

## Risks / Trade-offs

- [A gate that passed under 0.2.0-beta.5 fails under 0.2.0-beta.6] → The lane runs the gates after
  the bind and the repair, and the full proof runs at the archived head before landing. A failure
  is repaired at its owner, or the family restores the 0.2.0-beta.5 declaration in a new Change and
  binds the retained runtime.
- [A rollback after the repair] → ETHOS refuses it with `runtime_rollback_declaration_repaired`
  until a lane restores the predecessor's declaration; the release does not qualify that path.

## Migration Plan

Copy the declaration, lock it, install the locked supply, bind the runtime, repair the declaration,
record the local key if needed, run the gates, prove the archived head and qualify it on GitHub and GitLab. To
roll back, restore the 0.2.0-beta.5 declaration, lock and fields in a new Change, then bind the
retained runtime with the current console's `hook install --runtime <0.2.0-beta.5 runtime>`.
