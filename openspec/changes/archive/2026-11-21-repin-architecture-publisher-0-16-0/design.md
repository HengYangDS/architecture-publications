## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against v0.16.0`, run on 2026-11-21 with the
publisher at its v0.16.0 commit on the work as the Changes `settle-the-covers-and-two-names` and
`settle-four-spread-plate-lines` leave it, lists what the re-pin has to do:

| Work                   | Release | Files in scope changed | Citations the same, shifted, touched | Components and relations to reread | Refused, uncovered |
| ---------------------- | ------- | ---------------------- | ------------------------------------ | ---------------------------------- | ------------------ |
| Architecture Publisher | v0.16.0 | 29 of 90, none new     | 114, 85, 13                          | 13 and 30                          | none, none         |

## Goals / Non-Goals

**Goals:**

- The work describes its pinned release, with every claim cited at it and every file in scope owned.
- No statement of the work says what its release no longer does.

**Non-Goals:**

- A new part, view or question: the release adds no file the work's parts do not own.
- The release's plans: the queue's items are the contract's, and the work describes only what the source
  implements.

## Decisions

1. Move each shifted citation mechanically; reread each touched one.
   - Rests on: the worklist above, computed by the publisher's own check at the new pin.
   - Considered: rereading every citation; trusting the shift alone.
   - Chosen because: a shifted range holds the same bytes at new line numbers, and a touched range holds changed
     lines, so its citing words are read against the release's text and its range is set anew.
   - Applies to: citations of the guide and its diagram files, in both languages alike.
2. The work's words change only where the release changed a fact the work states.
   - Rests on: the 0.16.0 section of the repository's `CHANGELOG.md` at the new tag, and the diff of the listed
     components' files between the two pins.
   - Considered: describing every entry of the release; changing nothing but the pin.
   - Chosen because: a work describes what the pinned source implements at the level its parts and views already
     hold. The page's one call to Archify made a step of the guide untrue and is rewritten; the figures alone, the
     index and the default width enter the parts that implement them; the channel solver's speed-ups, which change
     no layout, stay out.
   - Applies to: the parts' details, the guide's tables and its history.
3. The release enters the history.
   - Rests on: the history's rule that a release enters when it changes what the product does for its users.
   - Chosen because: 0.16.0 adds files to every delivery, changes the default width of a page's image and adds an
     index to the edition.
   - Applies to: the event `v0160` and the prose that counts the releases.

## Risks / Trade-offs

- [A reread component keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files between the two pins, and `archpub check --repo` runs on each model at the new pin.
- [The Chinese work drifts from the English one] → Both languages hold the same citations at the same paths and
  ranges; the check runs on each, and readers other than the writer read the Chinese and the English the move
  added or changed.
