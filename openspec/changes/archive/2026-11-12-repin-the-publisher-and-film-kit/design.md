## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against <release>` lists, for a work, the files
that changed, moved or went, the files a claim now takes in, the relations whose files changed, what a build at
the release would refuse, the newly uncovered files and the fate of every citation: the same, shifted with its new
range, touched by a change inside it, moved or gone. For Architecture Publisher it lists 24 shifted and 8 touched
citations and nothing refused; for Film Kit 31 shifted, 14 touched, two newly uncovered files and nothing refused.

## Goals / Non-Goals

**Goals:**

- Both works describe their latest release, with every claim cited at it.

**Non-Goals:**

- ETHOS and AIGW, whose releases restructure their sources and are re-pinned in a Change of their own.
- The print editions, whose plates are rebuilt when the works are next published.

## Decisions

- Move each shifted citation to the range the worklist gives, mechanically, and reread each touched one against
  the new bytes, in both languages.
- Claim each newly uncovered file in the component whose directory holds it, and describe what a release adds
  that a reader of the work would look for, such as a new command.
- Add each release to its work's history as the timeline's last event, citing its CHANGELOG section.

## Risks / Trade-offs

- [A touched citation still points at text that no longer says what the page claims] → Every touched citation is
  read again at the new revision before the pin moves.
