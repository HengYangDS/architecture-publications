## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against <tag>`, run on 2026-11-27 with the released
Architecture Publisher 0.19.0 on each work as the publications' dev holds it (10dfe4a), lists what the re-pin has to
do (the Chinese model's worklist; the English one's is the same):

| Work                   | Release           | Commits | Files in scope changed                      | Citations the same, shifted, touched, gone | Components and relations to reread | Refused, uncovered |
| ---------------------- | ----------------- | ------- | ------------------------------------------- | ------------------------------------------ | ---------------------------------- | ------------------ |
| OpenAI Responses Proxy | v6.0.3 → v7.0.0   | 55      | 25 of 86 (24 modified, 1 deleted)           | 118, 55, 16, 2                             | 11 and 8                           | 2, 0               |
| AIGW Client            | v0.8.3 → v0.10.0  | 45      | 90 of 243 (90 modified)                     | 81, 74, 6, 0                               | 17 and 32                          | 0, 2               |
| Architecture Publisher | v0.16.0 → v0.21.0 | 180     | 50 of 90 (50 modified)                      | 57, 85, 74, 0                              | 21 and 40                          | 0, 8               |
| DDWG                   | v8.0.0 → v10.1.3  | 172     | 33 of 48 (30 modified, 3 deleted)           | 42, 10, 59, 0                              | 25 and 61                          | 0, 1               |
| Film Kit               | v0.26.0 → v0.35.0 | 421     | 96 of 155 (89 modified, 5 deleted, 2 moved) | 28, 58, 89, 7                              | 26 and 74                          | 20, 46             |

The proxy released v7.0.1 on the same day, after its worklist; the review of this Change found it, and the work
moves on to it with a worklist of its own: 9 commits, 7 of 85 files in scope modified, citations 136 the same, 48
shifted, 7 touched, 6 components and 12 relations to reread, nothing refused or uncovered.

## Goals / Non-Goals

**Goals:**

- Each work describes its pinned release, with every claim cited at it and every file in scope owned.
- No statement of a work says what its release no longer does.

**Non-Goals:**

- The guides' stated positions and sizes, which Architecture Publisher 0.20.0 and later set themselves: the
  publisher's queue item `page-figures` removes them once Archify's release allows it.
- The releases' plans: a work describes only what the source at its pin implements.

## Decisions

1. Move each shifted citation mechanically; reread each touched or gone one.
   - Rests on: the worklists above, computed by the publisher's own check at the new pins.
   - Considered: rereading every citation; trusting the shift alone.
   - Chosen because: a shifted range holds the same bytes at new line numbers; a touched range holds changed lines,
     so its citing words are read against the release's text and its range is set anew.
   - Applies to: citations of the guides and their diagram files, in both languages alike.
2. A work's words change only where its release changed a fact the work states.
   - Rests on: the sections of each repository's `CHANGELOG.md` between the two tags, and the diff of the listed
     components' files.
   - Considered: describing every entry of the releases; changing nothing but the pin.
   - Chosen because: a work describes what the pinned source implements at the level its parts and views already
     hold.
   - Applies to: the parts' details, the guides' tables, the overviews and the histories.
3. Verify with the released Architecture Publisher 0.19.0.
   - Rests on: 0.20.0 and later refuse the positions and sizes the works' guides state
     (`page_diagram_publisher_field`), which the works keep until Archify's release lets them drop them.
   - Considered: the latest release with that refusal skipped, as a measurement copy did.
   - Chosen because: a released checker, unchanged, that accepts the works as they stand; its coverage and currency
     checks are those the re-pin needs.
   - Applies to: both models of each work.
4. The repository's README alone names the publisher releases that check and build the works.
   - Rests on: the repository's README says 0.17.0 or later and each of the six works' READMEs says 0.15.0 or
     later, while 0.20.0 and later refuse every work's guide and the models need 0.17.0 to derive their files'
     addresses.
   - Considered: correcting the range in all seven places.
   - Chosen because: one statement, in the README that says how the works are built, cannot drift from six copies;
     each work's README points to it.
   - Applies to: `README.md` and the six works' READMEs, ETHOS's among them.
5. One Change for the five works.
   - Rests on: the same procedure, the same checker and the same changelog entry for each.
   - Chosen because: one lane, one proof and one record instead of five.
   - Applies to: this Change.

## Risks / Trade-offs

- [A reread part keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files, and `archpub check --repo` runs on each model at the new pin.
- [The Chinese drifts from the English] → Both languages hold the same citations at the same ranges; the check runs
  on each; a reader other than the writer reads the Chinese and the English each move added or changed.
- [A repository releases again before the lane lands] → The work stays one release behind until a later re-pin; the
  publisher's release chain reports the works behind at each of its releases.
