## Context

See [proposal.md](proposal.md). The review's rules, runner, sessions and confirmations are kept with Architecture
Publisher's working records; this Change commits the record, the rules and the data.

## Goals / Non-Goals

**Goals:**

- A reader of the trials finds that the review was made, late, and what it found.
- The findings stand here in a form the item `six-works` can work from, statement by statement.

**Non-Goals:**

- Correcting any work. The roadmap's rule is that defects found go to the queue.
- An acceptance or a refusal of any delivery: bytes, questions and form were not reviewed.

## Decisions

- The record states the reviewer's verdicts first and the classes of the confirmation second, and keeps them apart:
  the reviewer is of another origin than the author, the confirmers are not. Rejected: reporting only the confirmed
  count, which would let the author's origin decide what the other origin found.
- Where a confirmer doubted between two classes it took the worse for the work, and the record gives the number of
  such cases. Rejected: resolving the doubts here, which is the work of `six-works` on each statement.
- The record corrects the confirmers on one matter with evidence they could not see: the times on the works'
  timelines are the creation times of Git tags. It says how that was checked, and which findings it changes.
- The protocol is committed with the wrong time in its first line, as registered, and the record states the right
  times. Rejected: correcting the line, after which its digest would no longer be the registered one.
- The protocol and the two tasks are named in the formatter's ignore file. The formatter would re-wrap the JSON
  example in each task, and a formatted file no longer has the registered digest. Rejected: formatting them and
  recording a second digest, which nobody could check against the registered bytes.
- The brief the confirmers were given is not committed: it names paths of one workstation. Its classes are defined in
  the record.

## Risks / Trade-offs

- [The record could be read as a refusal of the six works] → its second paragraph says what it is and is not.
- [Half a megabyte of JSON joins the repository] → it is the evidence each later correction is checked against; it
  is formatted by the repository's formatter and never edited.
