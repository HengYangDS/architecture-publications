## Context

See [proposal.md](proposal.md). `archpub check --repo <checkout> --against <release>` listed, for ETHOS, 8
claims and 40 relation files a build at beta.8 would refuse and 56 newly uncovered files; for AIGW, 2 claims and
79 relation files refused, 8 newly uncovered files and 85 touched citations, most of them in documents 0.7.0
rewrote for its new vocabulary.

## Goals / Non-Goals

**Goals:**

- Both works describe their latest release in its own words, every claim cited at it.

**Non-Goals:**

- The print editions, whose plates are rebuilt when the works are next published.

## Decisions

- Claim each moved or new file where the code puts it: ETHOS's application modules join the component whose
  operation they carry, and its operation catalog becomes a component of its own.
- Retire a relation whose evidence is gone rather than keep it on a file that no longer imports its target;
  ETHOS's import contract now forbids its surfaces from importing the layers beneath the application.
- Rewrite AIGW's panels whose subject changed, the catalog lifecycle, the check depths, the configuration's
  entities and the rollout, and keep the panels whose subject still holds.

## Risks / Trade-offs

- [A citation that `archpub check` accepts can still point at the wrong lines once the pin is the release] →
  Every re-cited range was read against its claim at the release.
