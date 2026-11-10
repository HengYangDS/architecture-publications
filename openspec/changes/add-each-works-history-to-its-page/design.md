## Context

See [proposal.md](proposal.md). A page is the work's guide, an Archify explainer that Architecture Publisher delivers
after `archpub check --repo` verifies every cited line range at the pinned revision. A Film Kit prototype tried five
Archify capabilities the guides had not used: a timeline, a code excerpt and a facts table read well; a data flow of the
route did not fit the page width at four stages, and structural change marks rendered as a list of IDs.

## Goals / Non-Goals

**Goals:**

- Every page answers how its system got here, from its own release history.
- A page shows the file its reader writes, where the contract is such a file, as the pinned bytes.
- No new claim without a citation that `archpub check --repo` verifies.

**Non-Goals:**

- A roadmap with dates the repositories do not record; what is still open stays in each page's maturity panel.
- Data flows and change marks, which did not work in the prototype.
- The print editions, which are unchanged.

## Decisions

- **Content decides each block.** Every page gets a history; a code excerpt only where the reader writes or reviews a
  file (AIGW's team manifest, ETHOS's profile declaration, Film Kit's film declaration, Architecture Publisher's model);
  a facts table only where the sources fix values a reader needs.
- **Events are releases that change what users meet**, eight to twelve per work in three or four lanes, each at its
  tag's creator time and citing the lines of its own CHANGELOG section at the pin.
- **The history sits before the maturity panel**, or before the last panel where a guide has none, so a page ends on
  what is open.
- **Architecture Publisher re-pins in this Change**, so its history and page describe 0.11.0 together.

## Risks / Trade-offs

- [A history ends at the pin and ages with it] → Each re-pin extends the timeline with the citations it moves.
