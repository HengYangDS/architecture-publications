## Context

The publisher's Change `draw-the-overview-from-the-model` (released in 0.15.0) replaced the overview composition,
a Typst page an author placed by coordinates, by a statement in the model that the publisher draws on one page.
The works' overviews were written as compositions. The statements this Change puts into the models were made from
those compositions while the publisher's Change was built, and the publisher's acceptance drew the twelve pages
from them.

## Goals / Non-Goals

**Goals:**

- Every work checks and builds with Architecture Publisher 0.15.0 in both languages.
- An overview says what its composition said, in its author's words.
- The work on the publisher is true of the release that builds it.

**Non-Goals:**

- No new overview content beyond what a release of a described repository made necessary.
- No change to a work's views, parts or guide, except in the Architecture Publisher work, which is re-pinned.
- No delivery is committed; building and accepting stay with the roles `CONTRIBUTING.md` names.

## Decisions

1. **A statement carries its composition's wording.** Each text of a statement is the text the composition set at
   that place. A text is changed only where it was settled at its source by the repository's wording procedure,
   or where a release of the described repository made it untrue. No text is reworded to fit a line: the
   publisher sets a note that is too long for one line on several.
2. **One shape for a work's languages, checked.** The languages of a work state the same blocks, steps, stations
   and items with the same identifiers and references; only the texts differ. The input check compares the shapes
   and names the first place that differs, so a translation cannot drop a link or a block unseen.
3. **The Architecture Publisher work moves to v0.15.0 in this Change.** Its statement describes the publisher, and
   the release made two of its sentences untrue (the overview as the author's composition, and a refusal the
   release removed). A statement that the release draws must be true of that release, so the re-pin cannot follow
   later.
4. **A file new in a work's scope is owned by the part whose subject it implements.** A part is added only where
   no part of the work has that subject, with the relations that an import or a process call backs, on the view
   that draws its neighbours. This is the rule of the earlier re-pins.
5. **The history takes a release that changed what the system does for the roles that use it.** 0.15.0 enters the
   Architecture Publisher work's timeline, citing its changelog section at the pin.
6. **Verification by the release.** Each of the twelve models is checked with `archpub check --repo` of 0.15.0. The
   Architecture Publisher work is checked with `--against v0.15.0`: every citation the same, nothing refused, and
   no file in scope without an owner (`coverage.files.uncovered`, since the worklist of a model already at the pin
   lists nothing).
7. **A reader other than the writer reads the Chinese this Change adds or changes**, and each finding is settled at
   the source: the described product's own definition and the work's term table.

## Risks / Trade-offs

- [A statement differs from its composition in a place nobody compared] → the statements were drawn and read page
  by page against the compositions' pages in the publisher's acceptance; this Change adds the shape check between
  languages.
- [The publisher's work is large to move: 63 citations stand on changed lines and eleven files are new in scope]
  → the mechanical part is done by the re-pin script, and the rest is read by a holder and verified by the release.
- [A reader holds an older publisher] → the READMEs and `CONTRIBUTING.md` name 0.15.0 as the lowest version, and
  the older publisher refuses the model with its own message.

## Migration Plan

The Change lands whole: the models, the check and the texts together. To go back, revert the Change's commits;
the compositions return with them, and Architecture Publisher 0.14.0 builds the works again.
