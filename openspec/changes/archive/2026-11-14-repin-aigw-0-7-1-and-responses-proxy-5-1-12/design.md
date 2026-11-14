## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against <release>`, run with Architecture
Publisher 0.14.0 on 2026-11-15, lists for each work what a re-pin has to do:

| Work                   | Release | Cited files changed | Citations the same, shifted, touched | Components and relations to reread | Refused, uncovered |
| ---------------------- | ------- | ------------------- | ------------------------------------ | ---------------------------------- | ------------------ |
| AIGW                   | v0.7.1  | 17 of 245           | 93, 15, 1                            | 7 and 14                           | none               |
| OpenAI Responses Proxy | v5.1.12 | 5 of 85             | 136, 20, 3                           | 2 and 5                            | none               |

## Goals / Non-Goals

**Goals:**

- Both works describe their pinned release, with every claim cited at it.

**Non-Goals:**

- AIGW 0.7.2, which is tagged and not released.
- An `edition` object in any model, and the print editions: plates are rebuilt when the works are next published.
- A new part, view or question in either work.

## Decisions

- Move each shifted citation to the range the worklist gives, mechanically, and reread each touched one against
  the new bytes, in both languages. Reread each listed component and relation against its changed files, and
  change its words only where a release changed what they say.
- Describe what a release adds that a reader of the work would look for. For AIGW: a check that starts each client
  without a parent agent session's variables, a setup that keeps a changed `model` after an upgrade, and the labels
  a team file replaces listed in its preview. For the proxy: a stream that the upstream ends with a top-level
  `error` event is ended completely and reported as `stream_error`, the log names a stream's ending, and `--port`
  and `--timeout-seconds` refuse values that are not plain decimal or are out of range.
- A release enters a work's history when it changed what the system does for its users, citing its changelog
  section at the pin.
- One commit for each work.

## Risks / Trade-offs

- [A reread component keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files between the two pins before the pin moves, and `archpub check --repo` runs on each
  model of each language at the new pin.
- [The Chinese works drift from the English ones] → Both languages hold the same citations at the same paths and
  ranges, and models of the same shape; the check runs on each.
- [The pins are replaced by the rebuilds] → Expected: one more re-pin for each work after its repository's rebuild,
  from the mapping of old to new commits that the rebuild publishes.
