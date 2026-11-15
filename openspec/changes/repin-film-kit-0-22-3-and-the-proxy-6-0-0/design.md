## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against <release>`, run with Architecture
Publisher 0.14.0 on 2026-11-15, lists for each work what a re-pin has to do:

| Work                   | Release | Cited files changed | Citations the same, shifted, touched | Components and relations to reread | Refused, uncovered |
| ---------------------- | ------- | ------------------- | ------------------------------------ | ---------------------------------- | ------------------ |
| OpenAI Responses Proxy | v6.0.0  | 17 of 86            | 117, 40, 11                          | 11 and 23                          | none               |
| Film Kit               | v0.22.3 | 4 of 123            | 92, 41, 3                            | 2 and 5                            | none               |

## Goals / Non-Goals

**Goals:**

- Both works describe their pinned release, with every claim cited at it and every file in scope owned.
- No statement of the proxy's work says the proxy drains.

**Non-Goals:**

- An `edition` object in any model, and the print editions: plates are rebuilt when the works are next published.
- A new view or question in either work.
- Correcting what the review of 2026-11-15 found in these works beyond the statements this re-pin rewrites: those
  findings belong to the item `six-works`.

## Decisions

1. Move each shifted citation mechanically and reread each touched one.
   - Rests on: the worklist above, computed by the publisher's own check at the new pins.
   - Considered: rereading every citation of both works; trusting the shift alone.
   - Chosen because: a shifted range holds the same bytes at new line numbers, and a touched one does not; reading
     only the touched ones spends the reading where the text changed.
   - Applies to: citations of the guides and their diagram files, in both languages alike.
2. What the proxy's work said of the drain is removed where it described present behaviour, and kept as history
   where the history already recorded the release that introduced it.
   - Rests on: the section `## [6.0.0]` of the proxy's `CHANGELOG.md` at v6.0.0, under Removed.
   - Considered: keeping the drain's parts with a status of `retired`; removing every mention.
   - Chosen because: a work describes what the pinned source implements. The plates' `retired` row is not yet
     tested by a work, and a first use belongs to a Change that sets out to test it. History is true as history,
     and its last event says that 6.0.0 removed the drain.
   - Applies to: the proxy's model, guide, diagram files and overview, in both languages.
3. A release enters a work's history when it changed what the system does for its users, citing its changelog
   section at the pin.
   - Rests on: the rule the works' histories already follow.
   - Considered: entering every release.
   - Chosen because: both releases change behaviour (the proxy's by removal and refusal, Film Kit's by a new
     option), so both enter; no release between the pins is left out.
   - Applies to: `guide/history.timeline.json` and the guide's prose on where the timeline ends.
4. One commit for each work.
   - Rests on: the earlier re-pins.
   - Considered: one commit for both.
   - Chosen because: a work's move can then be read, and reverted, alone.
   - Applies to: this lane.

## Risks / Trade-offs

- [A reread component keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files between the two pins, and `archpub check --repo` runs on each model of each
  language at the new pin.
- [A mention of the drain survives] → The works' directories are searched for the removed names in both languages
  after the rewrite; what remains is history.
- [The Chinese works drift from the English ones] → Both languages hold the same citations at the same paths and
  ranges, and models of the same shape; the check runs on each.
