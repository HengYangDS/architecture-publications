## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against v0.8.2`, run on 2026-11-19 with the
source Architecture Publisher 0.15.0 is tagged at, on the work as it states its overview in its model, lists what
the re-pin has to do:

| Work        | Release | Files in scope changed | Citations the same, shifted, touched | Components and relations to reread | Refused, uncovered |
| ----------- | ------- | ---------------------- | ------------------------------------ | ---------------------------------- | ------------------ |
| AIGW Client | v0.8.2  | 16 of 241              | 94, 33, 0                            | 6 and 10                           | none               |

The changed files are the domain's model, its validation and its errors, the terminal's errors, two commands, the
credential helper's command, the Codex adapter's catalog, its catalog document and its reconciliation, four files
of the Hermes adapter, `go.mod` and the team file.

## Goals / Non-Goals

**Goals:**

- The work describes its pinned release, with every claim cited at it and every file in scope owned.
- No statement of the work says what its release no longer does.

**Non-Goals:**

- A new part, view or question: no file in scope is new, and the release adds no subject the work lacks.
- The plates of the print edition: they are rebuilt when the works are next built.

## Decisions

1. Move each shifted citation mechanically; none is touched.
   - Rests on: the worklist above, computed by the publisher's own check at the new pin.
   - Considered: rereading every citation; trusting the shift alone.
   - Chosen because: a shifted range holds the same bytes at new line numbers. What the release changed lies
     outside every cited range, so it is found by reading the changed files, which decision 2 does.
   - Applies to: citations of the guide and its diagram files, in both languages alike.
2. The work's words change only where the release changed a fact the work states.
   - Rests on: the section of the repository's `CHANGELOG.md` for 0.8.2, at the new tag, and the diff of the listed
     components' files between the two pins.
   - Considered: describing every entry of the release; changing nothing but the pin.
   - Chosen because: a work describes what the pinned source implements at the level its parts and views already
     hold. A statement the release made untrue is corrected, and a behaviour the work already describes is made to
     agree with the release; an entry the work has no place for is left out.
   - Applies to: the model with its overview statement, the guide and the diagram files, in both languages.
3. 0.8.2 enters the work's history.
   - Rests on: the rule the works' histories follow, that a release enters when it changed what the system does
     for a role that uses it.
   - Considered: naming the release at the pin only.
   - Chosen because: a configuration that was accepted is refused for two models of one label, and a model's
     label and Codex's picker show other names: a user meets each.
   - Applies to: `guide/history.timeline.json` and the guide's prose on where the timeline ends, in both languages.

## Risks / Trade-offs

- [A reread component keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files between the two pins, and `archpub check --repo` runs on each model at the new pin.
- [The Chinese work drifts from the English one] → Both languages hold the same citations at the same paths and
  ranges, and models of the same shape; the check runs on each, and a reader other than the writer reads the
  Chinese the move added or changed.
- [A changed text of the overview statement no longer fits its page] → The publisher's check draws the overview
  from the statement and refuses a page too tall or a text over another.
