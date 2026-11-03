## Context

See proposal.md for why. A model cites files by digest at its pinned revision,
and `archpub check --repo` reports the files in its coverage scope that no
source cites. Architecture Publisher accepts a glob in a coverage path from
its `glob-coverage-paths` Change on.

## Goals / Non-Goals

**Goals:**

- Each work describes its system as released, and every file in its declared
  scope is cited.

**Non-Goals:**

- Describing the repositories' tests, tools, CI or documentation.
- Accepting or publishing a delivery; that stays with the owner.

## Decisions

- **Pin each work at its system's latest release.** v0.2.0-alpha.28 and v0.6.0
  are what users run; a development head would date the work before anyone
  could read it.
- **Generate the citations, author the meaning.** A component's sources are
  the files that ordered path rules attribute to it, so no file in the scope
  is missed and none is cited twice; the components, their labels and details,
  the relations and the views are written for the reader. Each relation is
  kept only when an import in the source backs it, and cites the importing
  files.
- **Draw every relation.** Views are chosen so that each holds at most ten
  components and twelve relations, the density the poster lays out, and every
  relation appears in at least one of them.
- **Leave out Go's tests with a glob.** `**/*_test.go` names exactly the test
  files beside each package; no directory list can.

## Risks / Trade-offs

- [The publisher that checks the works lacks globs] → The AIGW work needs
  Architecture Publisher at or after the glob Change's landed head; the README
  says so.
- [Archify 3.2.0 cuts an explainer check receipt at 64 KiB on macOS, because
  `scripts/check-render-output.mjs` exits before its piped output drains, and
  the 11-view ETHOS page's receipt is longer] → The ETHOS work is checked and
  built without its page until its page is redesigned within Archify's
  four-diagram scale or Archify fixes the checker; its posters and overview
  carry the work meanwhile.
- [A cited file changes in a later release] → `archpub check --against`
  reports each cited file's fate, and a new pin is a change like this one.
