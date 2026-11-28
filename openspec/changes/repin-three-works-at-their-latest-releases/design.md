## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against <tag>`, run on 2026-11-28 with the released
Architecture Publisher 0.19.0 on each work as the publications' dev holds it (8084acc), lists what the re-pin has to
do (the Chinese model's worklist; the English one's is the same):

| Work                   | Release                         | First-parent commits | Files in scope changed                         | Citations the same, shifted, touched, gone | Components and relations to reread | Refused, uncovered |
| ---------------------- | ------------------------------- | -------------------- | ---------------------------------------------- | ------------------------------------------ | ---------------------------------- | ------------------ |
| AIGW Client            | v0.10.0 → v0.12.0               | 82                   | 132 of 257 (111 modified, 17 deleted, 4 moved) | 49, 102, 24, 0                             | 18 and 33                          | 23, 2              |
| OpenAI Responses Proxy | v7.0.2 → v8.0.0                 | 12                   | 27 of 85 (20 modified, 7 deleted)              | 87, 78, 25, 3                              | 13 and 29                          | 7, 0               |
| ETHOS                  | v0.2.0-beta.11 → v0.2.0-beta.12 | 242                  | 55 of 537 (55 modified)                        | 92, 63, 7, 0                               | 22 and 34                          | 0, 1               |

## Goals / Non-Goals

**Goals:**

- Each work describes its pinned release, with every claim cited at it and every file in scope owned.
- No statement of a work says what its release no longer does.

**Non-Goals:**

- The guides' stated positions and sizes, which Architecture Publisher 0.20.0 and later set themselves: the
  publisher's queue item `page-figures` removes them once Archify's release allows it.
- The releases' plans: a work describes only what the source at its pin implements.

## Decisions

1. The procedure, the checker and the record of the re-pin of 2026-11-27 (`repin-five-works-at-their-latest-releases`).
   - Rests on: its decisions 1 to 4, which hold for these releases: shifted citations moved, touched and gone ones
     reread; a work's words change only where its release changed a fact the work states; the released Architecture
     Publisher 0.19.0 verifies; the repository's README alone names the publisher releases.
   - Chosen because: the same works, the same checker and the same kind of release.
   - Applies to: the three works.
2. ETHOS follows its latest pre-release.
   - Rests on: ETHOS has published pre-releases only; the work pinned v0.2.0-beta.11 and the publications are bound to
     v0.2.0-beta.12.
   - Considered: waiting for 0.2.0.
   - Chosen because: a work follows its repository's latest release, and a pre-release is ETHOS's latest.
   - Applies to: the ETHOS work, and the check that a pin is its repository's latest release.
3. The README names the call that runs 0.19.0 where a later release is installed.
   - Rests on: the host keeps Architecture Publisher 0.21.0 as its global release with 0.19.0 installed beside it.
   - Chosen because: a reader who has the later release installed can build the works without changing it.
   - Applies to: `README.md`.

## Risks / Trade-offs

- [A reread part keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files, and `archpub check --repo` runs on each model at the new pin.
- [The Chinese drifts from the English] → Both languages hold the same citations at the same ranges; the check runs
  on each; a reader other than the writer reads the Chinese and the English each move added or changed.
- [A repository releases again before the lane lands, Architecture Publisher's 0.22.0 among them] → The work step
  refuses a pin that is not its repository's latest release; a work that falls behind after the landing is re-pinned
  in a later Change.
