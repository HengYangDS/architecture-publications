## Context

See [proposal.md](proposal.md). The previous rebind (`rebind-ethos-beta-11`, 2026-11-21) was made by the session that
governs the fleet; it left this one to the repository's holder (2026-11-28). The Data Department Work Guidelines took
0.2.0-beta.12 the same night with the same three platforms.

## Goals / Non-Goals

**Goals:**

- The repository runs ETHOS 0.2.0-beta.12, declared and locked for the platforms the fleet supports.

**Non-Goals:**

- The works: they are re-pinned by a Change of their own.
- The pipelines' projection, unless the check reports drift.

## Decisions

1. The three supported platforms only, in the declaration and in the lock.
   - Rests on: the owner's goal that no ETHOS-governed repository supports Windows, with nothing of it left; native
     `mise lock` refuses to drop a locked platform that the configuration still allows, so the lock's platforms are
     named (`lockfile_platforms`), as the Data Department Work Guidelines do.
   - Considered: keeping the Windows declarations until a later Change.
   - Chosen because: the rebind rewrites those lines anyway, and a later Change would touch them again.
   - Applies to: `.config/mise/config.toml`, `.config/mise/mise.lock`.
2. No wait after the release.
   - Rests on: the owner's exemption of ETHOS's own releases from the 24-hour wait, relayed by the session building
     ETHOS on 2026-11-28; third-party supply keeps it.
   - Considered: waiting until 24 hours after the release.
   - Chosen because: the owner asked for it.
   - Applies to: this Change.

## Risks / Trade-offs

- Node's musl and Intel macOS entries leave the lock: a host of either kind would resolve Node again. No CI job or
  host of this repository is one.
