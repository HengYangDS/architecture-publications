## Context

See [proposal.md](proposal.md). The reading is the one the repository asks for before Chinese goes to a reader:
a reader other than the writer, each finding settled at the source, a second reader for what was changed.

## Goals / Non-Goals

**Goals:**

- The four sentences say what their English says, in Chinese that reads as written.

**Non-Goals:**

- Any other sentence, and the English.
- The date of AIGW's release, which the reader remarked on: the prose gives the changelog's date, 18 November,
  and the timeline the tag's time, 04:45 on the 19th at +08:00. Both are true and both are cited; they stay.

## Decisions

1. Each finding is settled at its one place, in the wording the first reader proposed, and a second reader reads the
   four places against the English.
2. The released checker passes both models on a tree equal to the lane's before the commit, since the page's own
   writing checks refuse a sentence that chains three 的.

## Risks / Trade-offs

- [A correction makes a neighbour disagree] → the second reader reads each place in its paragraph or row.
