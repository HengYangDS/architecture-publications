## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against v0.24.0`, run on 2026-11-19 with the
released Architecture Publisher 0.15.0, lists what the re-pin has to do:

| Work     | Release | Files in scope changed | Citations the same, shifted, touched | Components and relations to reread | Refused, uncovered |
| -------- | ------- | ---------------------- | ------------------------------------ | ---------------------------------- | ------------------ |
| Film Kit | v0.24.0 | 31 of 138              | 68, 54, 32                           | 18 and 38                          | none, 10 new files |

The new files are the take's judgment with its two commands and their candidates (`narration/judgment.py`,
`judge.py`, `converge.py`, `candidates.py`) and the native renderer with its stage contract, its encoding, its
faces and its errors (`picture/renderer.py`, `native-canvas.mjs`, `stage-contract.mjs`, `encoding.py`, `faces.py`,
`errors.py`).

## Goals / Non-Goals

**Goals:**

- The work describes its pinned release, with every claim cited at it and every file in scope owned.
- No statement of the work says what its release no longer does.

**Non-Goals:**

- A new view or question: the release changes how two of the work's subjects are done and adds none.
- A layout by the publisher of the guide's diagrams: a node added to one of them takes the form of its
  neighbours, positions included, until the publisher's own item removes positions from every work.

## Decisions

1. Move each shifted citation mechanically; reread each touched one.
   - Rests on: the worklist above, computed by the publisher's own check at the new pin.
   - Considered: rereading every citation; trusting the shift alone.
   - Chosen because: a shifted range holds the same bytes at new line numbers, and a touched one holds changed
     text, which only a reading can set against the sentence that cites it.
   - Applies to: citations of the guide and its diagram files, in both languages alike.
2. The work's words change only where the release changed a fact the work states.
   - Rests on: the section of the repository's `CHANGELOG.md` for 0.24.0, at the new tag, and the diff of the
     listed components' files between the two pins.
   - Considered: describing every entry of the release; changing nothing but the pin.
   - Chosen because: a work describes what the pinned source implements at the level its parts and views already
     hold. A statement the release made untrue is corrected, and a behaviour the work already describes is made to
     agree with the release; an entry the work has no place for is left out.
   - Applies to: the model with its overview statement, the guide and the diagram files, in both languages.
3. A new file is owned by the part whose subject it implements; a part is added only for a subject no part has.
   - Rests on: each new file's own head at the new tag, and the rule the work's limits state, that each component
     cites every file the rules attribute to it.
   - Considered: one part for every new file; excluding the new files from the scope.
   - Chosen because: the scope is the engine's package, so a file of it is described; and a reader finds a
     subject under one part.
   - Applies to: the ten new files, in both models.
4. 0.24.0 enters the work's history.
   - Rests on: the rule the work's history follows, that a release enters when it changed how a film is made.
   - Considered: naming the release at the pin only.
   - Chosen because: a film that adopts the release replaces its render packages and draws its pictures by
     another renderer, and its narration is settled by a judgment it did not have: its author meets both.
   - Applies to: `guide/history.timeline.json` and the guide's prose on where the timeline ends, in both
     languages.

## Risks / Trade-offs

- [A reread component keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files between the two pins, and `archpub check --repo` runs on each model at the new pin.
- [The Chinese work drifts from the English one] → Both languages hold the same citations at the same paths and
  ranges, and models of the same shape; the check runs on each, and a reader other than the writer reads the
  Chinese the move added or changed before any delivery is built from it.
- [A changed text of the overview statement no longer fits its page] → The publisher's check draws the overview
  from the statement and refuses a page too tall or a text over another.
