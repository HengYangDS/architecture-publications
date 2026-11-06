## Context

See [proposal.md](proposal.md). `.config/mise/config.toml` declares the ETHOS release that the
hosted jobs install, and the repository-common Git directory selects the runtime that every
worktree of the family runs. Both name 0.2.0-beta.4 today. The GitHub workflow and the GitLab
pipeline each run one macOS job that installs ETHOS from that declaration with Mise 2026.10.25,
which `.config/ci/verification.toml` pins.

## Goals / Non-Goals

**Goals:**

- Run every gate and lifecycle command of the family, locally and in the hosted macOS jobs, on
  0.2.0-beta.5.
- Keep the 0.2.0-beta.4 runtime available as the rollback until the landing is accepted.

**Non-Goals:**

- Changing any gate, check, publication, runner declaration, the hosted jobs' Mise, the Node
  release or the CI projection.

## Decisions

- Copy the release's own declaration unchanged and lock it with native `mise lock`, as the earlier
  move did. Each platform checksum is checked against the release's `SHA256SUMS` and the published
  asset digests first, so the URLs and checksums keep one published source.
- Write the lock with the official Mise 2026.10.25 binary, whose digest equals its release asset,
  because the hosted jobs read the lock with that release. The lock keeps `lockfile_version = 3`.
- Bind through the locked 0.2.0-beta.5 console, so the selected runtime is the one the lock
  declares.

## Risks / Trade-offs

- [A gate that passed under 0.2.0-beta.4 fails under 0.2.0-beta.5] → Three governed repositories
  passed their full host gates under the released 0.2.0-beta.5. This lane runs the 0.2.0-beta.5
  gates after the bind, and the full proof runs at the archived head before landing. A failure is
  repaired at its owner, or the family binds the retained 0.2.0-beta.4 runtime again.
- [A lock written by a newer Mise is unreadable to the hosted jobs] → The lock is written by the
  release the hosted jobs run, and its version is checked to stay 3.

## Migration Plan

Copy the declaration, lock it, install the locked supply, bind the runtime, run the gates, prove the
archived head and qualify it on GitHub and GitLab. To roll back, restore the 0.2.0-beta.4
declaration and lock in a new Change and bind the retained runtime with the current console's
`hook install --runtime <0.2.0-beta.4 runtime path>`.
