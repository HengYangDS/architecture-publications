## Context

See [proposal.md](proposal.md). The comparison of lines on screen had two holders read plate 05 in four cells at
three widths, with no pass line: its readings sat beside the measured widths. The item that now builds the admitted
rows into the product needs a line to be read against.

## Goals / Non-Goals

**Goals:**

- A line that stands here in a commit dated before the first reading of a rebuilt plate.

**Non-Goals:**

- The readings and their record.
- A line for any other plate or for a reader that is not an agent.

## Decisions

- The line is set on the same plate, items, holders and scoring as the comparison, so that its numbers are
  comparable: eighteen readings, three groups of items.
- Each line allows the misses the comparison's own best cell or its neighbours showed: one of 36 on the hub, four of
  54 on cited files, three of 54 on the items that are the same task everywhere. Rejected: asking for every answer
  right, which one misread name at half size would fail.
- A result below a line has a consequence stated beforehand, row by row; the items that test the readers and not
  the plate lead to one more run and then to "undecided".

## Risks / Trade-offs

- [The line was set by the session that also builds the rows] → It is committed before any reading, the owner's word
  on it is recorded with the item's decisions, and the line is not moved afterwards.
