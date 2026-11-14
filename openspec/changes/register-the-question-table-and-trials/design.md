## Context

See [proposal.md](proposal.md). The trials are run from Architecture Publisher's own work directory by scripts
that are not part of either repository's product; this repository holds what must be fixed beforehand and what a
later reader needs to judge a result: the questions, the rules and the records.

## Goals / Non-Goals

**Goals:**

- Each trial's rules stand in a signed commit dated before its first run.
- A reader of a result finds its items, its answers and its scoring rule beside it.

**Non-Goals:**

- A check that grades a work against the question table. The publisher's model gains that with its next
  version, and until then the matrices are filled by hand. This Change checks the table's own form only.
- The scripts that run and score the trials. They stay with the publisher's work directory, and the reader
  protocol names each by its SHA-256.
- Corrections to the works. The five statements a reviewer refused outside the seeds are listed in the record as
  candidates and are corrected by a Change of their own.

## Decisions

- The question table is one JSON file. Each entry has an id, the lens it belongs to, the roles that ask it, the
  question, and a genre when it applies to one kind of repository only. The first table, of thirteen compound
  questions, let one answered clause count for a whole entry; all three graders found that, so the table was split
  before it was committed, and the record keeps both passes.
- Answers of the reader experiment are committed with the items. A subject never sees this repository: it gets a
  room with the described repository at its pin and what its arm adds.
- The seeded work of the reviewer check is kept as a patch against the published work, with the seed author's key.
- Records are dated directories or files and are never edited after the run they record; a correction is a new
  file beside them.

## Risks / Trade-offs

- [The answers are public before the experiment ends] → subjects are isolated by rule from everything but their
  room, and the runner voids a run that names a path outside it.
- [A matrix filled by hand by an agent is taken for a checked fact] → each matrix states what was verified
  mechanically, that cited files and line ranges exist at the pin, and that no one judged whether they support
  the statements.

## Migration Plan

None.

## Open Questions

None.
