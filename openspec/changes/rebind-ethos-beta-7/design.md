## Context

See [proposal.md](proposal.md). The move follows ETHOS's successor-first adopter cutover: bind the
release in the lane, prove, publish the proposal from the lane, then land and publish from the
canonical root. Before the release, a disposable-clone pre-check of the candidate ran this
repository's status, paradigm-repair preview, bootstrap and full host proof under the candidate's
runtime. GitLab's jobs run only on its macOS runner, which uses the Mise its guest provides.

## Goals / Non-Goals

**Goals:**

- Run every gate and lifecycle command of the family, locally and in the hosted macOS jobs, on
  0.2.0-beta.7.
- Keep the 0.2.0-beta.6 runtime as the rollback until the landing is accepted.

**Non-Goals:**

- Changing any gate, check, publication, runner declaration or the Node release.
- Moving the hosted jobs' Mise, which `refresh-ci-mise-2026-11-5` already did in its own lane
  (landed `cb0004c` on 10 November 2026).
- Re-pinning any work's model revision, which is the landing owner's content work; the input check
  then requires that work's README and term table to name its title and the new revision.

## Decisions

- Copy the release's own declaration unchanged and lock it with native `mise lock`, after checking
  each platform checksum against the release's `SHA256SUMS` and the published asset digests; the
  lock stays at version 3 because locking an existing lock again keeps its version, and the Node
  entries stay unchanged.
- Take the regenerated workflow only through `ethos lane project --apply`, so the `jdx/mise-action`
  pin comes from the release's common model.

## Risks / Trade-offs

- [A gate that passed under 0.2.0-beta.6 fails under 0.2.0-beta.7] → The lane runs the gates after
  the bind, and the full proof runs at the archived head before landing. A failure is repaired at
  its owner, or the family restores the 0.2.0-beta.6 declaration in a new Change and binds the
  retained runtime.

## Migration Plan

Copy the declaration, lock it, install the locked supply, bind the runtime, generate the pipelines,
run the gates, prove the archived head and qualify it on GitHub's and GitLab's macOS jobs. To roll
back, restore the 0.2.0-beta.6 declaration and lock in a new Change, then bind the retained runtime
with the current console's `hook install --runtime <0.2.0-beta.6 runtime>`.
