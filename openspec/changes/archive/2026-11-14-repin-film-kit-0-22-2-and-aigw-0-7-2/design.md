## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against <release>`, run with Architecture
Publisher 0.14.0 on 2026-11-15, lists for each work what a re-pin has to do:

| Work     | Release | Cited files changed | Citations the same, shifted, touched | Components and relations to reread | Refused, uncovered                                       |
| -------- | ------- | ------------------- | ------------------------------------ | ---------------------------------- | -------------------------------------------------------- |
| Film Kit | v0.22.2 | 19 of 119           | 77, 41, 9                            | 13 and 23                          | none refused; `src/filmkit/picture/slivers.py` uncovered |
| AIGW     | v0.7.2  | 13 of 245           | 94, 18, 2                            | 6 and 9                            | none                                                     |

## Goals / Non-Goals

**Goals:**

- Both works describe their pinned release, with every claim cited at it and every file in scope owned.

**Non-Goals:**

- An `edition` object in any model, and the print editions: plates are rebuilt when the works are next published.
- A new view or question in either work.

## Decisions

- Move each shifted citation to the range the worklist gives, mechanically, and reread each touched one against
  the new bytes, in both languages. Reread each listed component and relation against its changed files, and
  change its words only where a release changed what they say.
- Give the uncovered file to the component whose files import it. A relation is drawn for an import of code, as the
  works already do; a new component is added only if no existing one owns what the file does.
- Describe what a release adds that a reader of the work would look for. For Film Kit: the sound check before the
  picture, voice clarity measured as the reviewers measure it, a caption cue's typeset text, and the edge slivers
  that the picture comparison measures. For AIGW: what a client check says and shows of a client's own warning or
  error, the wider redaction, and schema version 4 of the check's JSON document.
- A release enters a work's history when it changed what the system does for its users, citing its changelog
  section at the pin. Film Kit's 0.22.1, which moves the renderer and a dependency without changing a frame, does
  not.
- One commit for each work.

## Risks / Trade-offs

- [A reread component keeps words its changed files no longer support] → Each listed component and relation is read
  against the diff of its files between the two pins before the pin moves, and `archpub check --repo` runs on each
  model of each language at the new pin.
- [The Chinese works drift from the English ones] → Both languages hold the same citations at the same paths and
  ranges, and models of the same shape; the check runs on each.
- [The described repositories release again before this lands] → Expected for Film Kit, which released three times
  in one night. The lane lands what it holds; the next release is the next lane's.
