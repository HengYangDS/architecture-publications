## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against <tag>`, run on 2026-11-28 with the released
Architecture Publisher 0.19.0, lists what the re-pin has to do (the Chinese model's worklist; the English one's is the
same). DDWG moved in two steps, each from the work as the step before left it:

| Work                   | Release           | Commits | Files in scope changed     | Citations the same, shifted, touched, gone | Components and relations to reread | Refused, uncovered |
| ---------------------- | ----------------- | ------- | -------------------------- | ------------------------------------------ | ---------------------------------- | ------------------ |
| Architecture Publisher | v0.21.0 → v0.22.0 | 38      | 33 of 107 modified; 15 new | 104, 92, 28, 0                             | 14 and 24                          | 0, 1               |
| DDWG                   | v10.1.3 → v10.1.4 | 14      | 9 of 48 modified           | 94, 22, 3, 0                               | 7 and 5                            | 0, 0               |
| DDWG                   | v10.1.4 → v10.2.0 | 8       | 4 of 48 modified           | 99, 19, 1, 0                               | 3 and 8                            | 0, 0               |

## Goals / Non-Goals

**Goals:**

- Each work describes its pinned release, with every claim cited at it and every file in scope owned.
- No statement of a work says what its release no longer does.

**Non-Goals:**

- The guides' stated positions and sizes, which Architecture Publisher 0.20.0 and later set themselves: the
  publisher's queue item `page-figures` removes them once Archify's release allows it.
- What the publisher's dev holds after 0.22.0 (an outside card set on its side, a layout ranked by its blank): a
  work describes only what the source at its pin implements.

## Decisions

1. The procedure, the checker and the record of the re-pin of 2026-11-28 (`repin-three-works-at-their-latest-releases`).
   - Rests on: its decision 1 and the decisions of 2026-11-27 it names: shifted citations moved, touched ones reread;
     a work's words change only where its release changed a fact the work states; the released Architecture
     Publisher 0.19.0 verifies; the repository's README alone names the publisher releases.
   - Chosen because: the same works, the same checker and the same kind of release.
   - Applies to: the two works.
2. DDWG pins v10.2.0, reached through v10.1.4.
   - Rests on: v10.2.0 was tagged at 22:39, after the move to v10.1.4 had begun (its worklist 22:31); its worklist was taken from the
     work at v10.1.4, so the second step reread only what v10.2.0 changed.
   - Considered: landing v10.1.4 first and v10.2.0 in a later Change.
   - Chosen because: a work follows its repository's latest release, and one Change reaches it.
   - Applies to: the DDWG work.
3. Each work's history keeps its own rule.
   - Rests on: the DDWG work takes a release that changed what members, Agents or maintainers read; the Architecture
     Publisher work takes every release since 0.4.0.
   - Chosen because: v10.2.0 adds two rules members read (what hiring may weigh, how a tier is told), so it enters;
     v10.1.4 retold one page purpose first and changed none of its rules, as v10.1.1 to v10.1.3 before it, so it does
     not; 0.22.0 enters by its work's rule.
   - Applies to: both timelines and the sentences that count their events.

## Risks / Trade-offs

- [A reread part keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files, and `archpub check --repo` runs on each model at the new pin.
- [The Chinese drifts from the English] → Both languages hold the same citations at the same ranges; the check runs
  on each; a reader other than the writer reads the Chinese and the English each move added or changed.
- [A repository releases again before the lane lands] → The work step refuses a pin that is not its repository's
  latest release; a work that falls behind after the landing is re-pinned in a later Change.
