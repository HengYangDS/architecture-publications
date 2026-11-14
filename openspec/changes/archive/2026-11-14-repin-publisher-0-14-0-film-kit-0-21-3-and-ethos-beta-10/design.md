## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against <release>`, run with Architecture
Publisher 0.14.0 on 2026-11-15, lists for each work what a re-pin has to do:

| Work                   | Release        | Cited files changed | Citations the same, shifted, touched | Components and relations to reread | Refused, uncovered |
| ---------------------- | -------------- | ------------------- | ------------------------------------ | ---------------------------------- | ------------------ |
| Architecture Publisher | v0.14.0        | 10 of 71            | 140, 37, 10                          | 5 and 5                            | none               |
| Film Kit               | v0.21.3        | 2 of 119            | 103, 22, 1                           | 1 and none                         | none               |
| ETHOS                  | v0.2.0-beta.10 | 32 of 515           | 115, 28, none                        | 21 and 18                          | none               |

## Goals / Non-Goals

**Goals:**

- The three works describe their pinned release, with every claim cited at it.

**Non-Goals:**

- The works on AIGW and the Responses proxy, which wait for their repositories' history rebuilds, and the work on
  the work guidelines, whose pin is its latest release.
- An `edition` object in any model, and the print editions: plates are rebuilt when the works are next published.
- A new part, view or question in any work. The question table's findings are for the roadmap's later items.

## Decisions

- Move each shifted citation to the range the worklist gives, mechanically, and reread each touched one against
  the new bytes, in both languages. Reread each listed component and relation against its changed files, and
  change its words only where the release changed what they say.
- Describe what a release adds that a reader of the work would look for. For Architecture Publisher: justified
  details and their line breaking, kerning in the engine's measure, and the key line set by its baseline with
  centred marks. For ETHOS: the canonical-text format's owner, the Markdown list rule, the package-marker docstring
  rule, the paradigm repair named as a refusal's next action, and `prunable` in a lane's status. For Film Kit: the
  engine package's version.
- A release enters a work's history when it changed what the system does for its users, as the history's own rule
  says. A release that only moves the supply, as Film Kit's 0.21.3, does not, and the history then ends below
  the pin; the README and scope still name the pin.
- One commit for each work, so that a fault in one does not hold the others.

## Risks / Trade-offs

- [A reread component keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files between the two pins before the pin moves, and `archpub check --repo` runs on each
  model of each language at the new pin.
- [The Chinese works drift from the English ones] → Both languages hold the same citations at the same paths and
  ranges, and models of the same shape; the check runs on each.
- [Twenty-one components of ETHOS are many to reread in one sitting] → The worklist is split by component among
  holders that each reread a few, and one holder reads the whole diff of the work before it is committed.
