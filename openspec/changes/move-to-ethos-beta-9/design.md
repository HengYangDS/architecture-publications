## Context

See [proposal.md](proposal.md). The move follows ETHOS's successor-first adopter cutover: bind the
release in the lane, prove, publish the proposal from the lane, then land and publish from the
canonical root. The same lane re-pins the ETHOS work at v0.2.0-beta.9, so one proof and one CI round
carry the runtime and the work that describes it. Between 0.2.0-beta.8 and 0.2.0-beta.9 the embedded OpenSpec moves to
2.0.0 and the redaction scan is shared; the common CI model is unchanged. GitLab's jobs run only on
its macOS runner, which uses the Mise its guest provides.

## Goals / Non-Goals

**Goals:**

- Run every gate and lifecycle command of the family, locally and in the hosted macOS jobs, on
  0.2.0-beta.9.
- Keep the 0.2.0-beta.8 runtime as the rollback until the landing is accepted.
- The ETHOS work describes v0.2.0-beta.9.

**Non-Goals:**

- Changing any gate, check, runner declaration, the Node release or any work but ETHOS.
- Moving the hosted jobs' Mise.

## Decisions

- Copy the release's own declaration unchanged and lock it with native `mise lock` from the Mise
  that the hosted jobs run, after checking each platform checksum against the release's `SHA256SUMS`
  and the published asset digests; the lock stays at version 3 and the Node entries stay unchanged.
- Re-pin the ETHOS work from the worklist `archpub check --against v0.2.0-beta.9` produces, as the
  earlier re-pins did, and keep both languages equivalent.
- Check the pipelines with `ethos lane project --check`; a difference would come only from the
  release's common model and is taken through `ethos lane project --apply`.

## Risks / Trade-offs

- [A gate that passed under 0.2.0-beta.8 fails under 0.2.0-beta.9] → The lane runs the gates after
  the bind, and the full proof runs at the archived head before landing. A failure is repaired at
  its owner, or the family restores the 0.2.0-beta.8 declaration in a new Change and binds the
  retained runtime.

## Migration Plan

Copy the declaration, lock it, install the locked supply, bind the runtime, check the pipelines, run
the gates, prove the archived head and qualify it on GitHub's and GitLab's macOS jobs. To roll back,
restore the 0.2.0-beta.8 declaration and lock in a new Change, then bind the retained runtime with
the current console's `hook install --runtime <0.2.0-beta.8 runtime>`.
