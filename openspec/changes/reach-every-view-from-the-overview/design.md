## Context

See [proposal.md](proposal.md). The publisher counts a view as reached when any element of the overview statement
carries its id as `view` (`unreachedViews` in its `src/build.mjs`); an element names at most one view. The places were
chosen by the subject of each view against the elements of each overview, in both languages, and the new words were
read by a reader other than their writer (the publisher's work directory, `edition-map/views-placement.md`).

## Goals / Non-Goals

**Goals:**

- Every view of the six works is named by its overview.
- The input check holds it for every work, now and later.

**Non-Goals:**

- The publisher's own refusal of an unreached view: that refuses a model another release accepted, a change of the
  publisher's contract, weighed after this Change has landed.
- The other clauses of `edition-map` (the head band's link back, the answer on every plate, the overview's three
  sizes), which change every plate page and come with drawings first.

## Decisions

- **The subject decides the place.** ETHOS's `status` view is the reading a lane takes before it writes ("status ·
  prewrite" in its write order), so it is a station of the lane step. Its `runtime` view has no element of its subject,
  so it gets a three-item block; the first item leaves `runtime/CURRENT` to the structure block, so that a fact is
  stated once on the page. AIGW Client's first view runs from a command to the client files, the subject of the
  operator's block; Film Kit's runs from the film's sources to its packaged films, which its step Package ends.
- **The rule in the input check.** `verifyModel` refuses a view no element names, beside the rules that a view has a
  title and a summary of its own. Its test stands in a file of its own, since the input test file stands at 499 of
  the 500 counted lines; the test files share one model, directory and writer from `tests/fixtures/works.mjs`, and
  `npm test` names its files by a pattern, so a new test file runs without a list to keep.
- **Edited where the change stands.** The models are edited at the exact span of the object they change, and must
  parse to the intended model with every other value unchanged.

## Risks / Trade-offs

- ETHOS's overview is the densest of the works: the station and the block add a node and three lines. Built and
  looked at on the Chinese edition, they fit; the English edition builds and measures as before.
- A work added later must name every view on its overview; the check says which.
