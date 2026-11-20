## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against v0.26.0`, run on 2026-11-20 with the
released Architecture Publisher 0.15.0 on the work as its reading of that day settled it, lists what the re-pin has
to do:

| Work     | Release | Files in scope changed | Citations the same, shifted, touched | Components and relations to reread | Refused, uncovered |
| -------- | ------- | ---------------------- | ------------------------------------ | ---------------------------------- | ------------------ |
| Film Kit | v0.26.0 | 26 of 148, seven new   | 92, 60, 22                           | 14 and 31                          | none, seven        |

## Goals / Non-Goals

**Goals:**

- The work describes its pinned release, with every claim cited at it and every file in scope owned.
- No statement of the work says what its release no longer does.

**Non-Goals:**

- A new part, view or question: each new file belongs to a part the work has.
- The plates of the print edition: they are rebuilt when the works are next built.

## Decisions

1. Move each shifted citation mechanically; reread each touched one.
   - Rests on: the worklist above, computed by the publisher's own check at the new pin.
   - Considered: rereading every citation; trusting the shift alone.
   - Chosen because: a shifted range holds the same bytes at new line numbers, and a touched range holds changed
     lines, so its citing words are read against the release's text and its range is set anew.
   - Applies to: citations of the guide and its diagram files, in both languages alike.
2. The work's words change only where the releases changed a fact the work states.
   - Rests on: the sections of the repository's `CHANGELOG.md` for 0.25.0 and 0.26.0, at the new tag, and the diff
     of the listed components' files between the two pins.
   - Considered: describing every entry of the releases; changing nothing but the pin.
   - Chosen because: a work describes what the pinned source implements at the level its parts and views already
     hold; an entry the work has no place for (a review's accepted severities, a refusal that names every problem
     at once) stays out.
   - Applies to: the parts' details, the guide's tables and its history.
3. A new file goes to the part whose subject it implements.
   - Rests on: the head of each new file at the new tag.
   - Chosen because: the release record and the list of what a release asks belong to the engine's package, the
     runtime's fit to the auditions, the still record and the picture's template to the picture's rendering, and
     the release from a delivered build to reproduction.
   - Applies to: the seven files the worklist names as uncovered.

## Risks / Trade-offs

- [A reread component keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files between the two pins, and `archpub check --repo` runs on each model at the new pin.
- [The Chinese work drifts from the English one] → Both languages hold the same citations at the same paths and
  ranges, and models of the same shape; the check runs on each, and a reader other than the writer reads the
  Chinese the move added or changed.
- [A call the releases add is not drawn] → The work already says that not every call is drawn; the calls the new
  files make to other parts stay undrawn, and their files are owned.
