## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against <release>` lists, for a work, the files
that changed, moved or went, the files a claim now takes in, the relations whose files changed, what a build at
the release would refuse, the newly uncovered files and the fate of every citation: the same, shifted with its new
range, touched by a change inside it, moved or gone. For Architecture Publisher at v0.13.1 it lists 69 shifted and
29 touched citations of 159, one newly uncovered file and nothing refused; for Film Kit at v0.21.2, 30 shifted and
11 touched of 120, two newly uncovered files and nothing refused.

## Goals / Non-Goals

**Goals:**

- Both works describe their pinned release, with every claim cited at it.

**Non-Goals:**

- The works on AIGW and the Responses proxy, which wait for their repositories' history rebuilds, and the works on
  ETHOS and the work guidelines, whose pins are their latest releases.
- An `edition` object in any model: each work's palette is chosen with its review set, in a Change of its own.
- The print editions, whose plates are rebuilt when the works are next published.

## Decisions

- Move each shifted citation to the range the worklist gives, mechanically, and reread each touched one against
  the new bytes, in both languages.
- Give each newly uncovered file to the component whose files alone import it: `src/style.mjs` to the publisher's
  builder, `delivery/spotlight.py` to Film Kit's verification and `picture/label_matches.py` to its picture gate.
- Describe what a release adds that a reader of the work would look for: the publisher's strips, palettes, age
  bands and sealed acceptance, with one new relation from acceptance to the edition; Film Kit's Spotlight readback
  and its engine package's version and dependencies. A relation is drawn for an import of code, not of an error
  class alone, as the works already do.
- Add each release to its work's history as the timeline's last events, citing its CHANGELOG section.

## Risks / Trade-offs

- [A touched citation still points at text that no longer says what the page claims] → Every touched citation is
  read again at the new revision before the pin moves.
- [The Chinese works drift from the English ones] → Both languages hold the same citations at the same paths and
  ranges, and models of the same shape; the check runs on each.
