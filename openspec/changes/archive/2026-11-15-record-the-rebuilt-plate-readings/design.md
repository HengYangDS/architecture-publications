## Context

See [proposal.md](proposal.md). The pass line stands in `trials/screen/2026-11-15-figure-reading-pass-line.md`,
committed at 05:53:50 CST on 2026-11-15; the readings ran from 06:45 to 06:48 CST. The working record of the
readings and the owner's ruling are kept with Architecture Publisher's working records.

## Goals / Non-Goals

**Goals:**

- The record the pass line promised, with the miss stated as a miss.
- The owner's ruling in the owner's words, and what it does and does not decide.

**Non-Goals:**

- Any change to the pass line or to the earlier records, which are not edited after their runs.
- A judgement of form: no holder has passed the seeded check on defects of form.

## Decisions

- The record states the result against the line before it states the ruling, and says that the row stays by the
  owner's decision and not because it passed. Rejected: reporting the hub's items at 1920 and 2400 px only, where
  every answer was right; the registered line counts all three widths and is not moved.
- The record names the contradiction between the pass line, which counts readings at 960 px, and the screen trial's
  definitions, which call that width "never a stop line", and leaves it open. Rejected: resolving it here, which
  would move the line after a reading.
- The reviewer's list is committed with its record and named as an exception in the index, as the items of the
  figure-reading check were: it was fixed in a working file before its run, and its SHA-256 is in the record.
- The list keeps its bytes, so that its digest can be checked against the record.

## Risks / Trade-offs

- [A record written by the session that builds the rows reads kindly] → the table of results leads, the two wrong
  answers are quoted, and the ruling is quoted and not paraphrased.
- [The list's bytes might not meet this repository's formatter] → it is checked before the commit; if the formatter
  would change it, the list stays out of the formatter's inputs by the formatter's own ignore file and the record
  says so.
