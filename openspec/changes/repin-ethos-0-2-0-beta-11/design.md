## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against v0.2.0-beta.11`, run on 2026-11-21 with
the released Architecture Publisher 0.16.0 on the work as the Changes before this one leave it, lists what the
re-pin has to do:

| Work  | Release        | Files in scope changed | Citations the same, shifted, touched | Components and relations to reread | Refused, uncovered |
| ----- | -------------- | ---------------------- | ------------------------------------ | ---------------------------------- | ------------------ |
| ETHOS | v0.2.0-beta.11 | 104 of 521, five new   | 109, 44, 2                           | 32 and 56                          | none, five         |

## Goals / Non-Goals

**Goals:**

- The work describes its pinned release, with every claim cited at it and every file in scope owned.
- No statement of the work says what its release no longer does.

**Non-Goals:**

- A new part, view or question: each new file belongs to a part the work has.
- The release's measured times: the proof's timings stay the measurement of 2026-11-19 under beta.10, which the
  work dates.

## Decisions

1. Move each shifted citation mechanically; reread each touched one.
   - Rests on: the worklist above, computed by the publisher's own check at the new pin.
   - Considered: rereading every citation; trusting the shift alone.
   - Chosen because: a shifted range holds the same bytes at new line numbers, and a touched range holds changed
     lines, so its citing words are read against the release's text and its range is set anew.
   - Applies to: citations of the guide and its diagram files, in both languages alike.
2. The work's words change only where the release changed a fact the work states.
   - Rests on: the beta.11 section of the repository's `CHANGELOG.md` at the new tag, and the diff of the listed
     components' files between the two pins.
   - Considered: describing every entry of a release of 511 commits; changing nothing but the pin.
   - Chosen because: a work describes what the pinned source implements at the level its parts and views already
     hold; an entry the work has no place for (a CLI's new option, a worker cap, a retention period) stays out.
   - Applies to: the parts' details, the guide's tables and its history.
3. A new file goes to the part whose subject it implements.
   - Rests on: the head of each new file at the new tag.
   - Chosen because: the registered gap codes of public results belong to the contracts, and the catalog of gate
     providers to the gate policy.
   - Applies to: the five files the worklist names as uncovered.

## Risks / Trade-offs

- [A reread component keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files between the two pins, and `archpub check --repo` runs on each model at the new pin.
- [The Chinese work drifts from the English one] → Both languages hold the same citations at the same paths and
  ranges; the check runs on each, and readers other than the writer read the Chinese and the English the move added
  or changed.
