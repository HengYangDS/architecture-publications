## Context

See [proposal.md](proposal.md). The reader experiment's protocol fixes arm D's pages before any item is shown, and
its runs ended on 2026-11-15. The page is therefore both a statement about ETHOS that a reader of this repository
can find, and the material of a finished experiment.

## Goals / Non-Goals

**Goals:**

- No file of this repository states 512 as ETHOS's per-file ceiling as a present fact.
- The experiment's record still says exactly what its readers were given.

**Non-Goals:**

- Any change of a score, an item or an outcome of the experiment.
- ETHOS's own decision record, which ETHOS corrects.

## Decisions

1. The page is corrected, and the record keeps the line as the readers had it.
   - Rests on: the owner's instruction of 2026-11-16, 「都改成 500」, given after the alternative was put; DR-0019
     at the experiment's pin (999784081fa3), lines 44 to 45, which state the ceiling of 500 and call DR-0010's
     phrase stale; a search of the item bank, which finds no item on the ceiling.
   - Considered: keeping the page as the experiment's material and noting the correction in the record only (the
     holder's first proposal); correcting the page with no note.
   - Chosen because: the owner decided it. A page that states a wrong limit is found and believed by a reader who
     never opens the record; the record can carry the history, since it is where the experiment is described, and
     Git keeps the page's earlier bytes.
   - Applies to: this page and its record. A later correction of an experiment's material follows the same form:
     correct, and quote what was given in the record.

## Risks / Trade-offs

- [The record no longer matches the page a reader opens] → The record quotes the earlier line word for word, names
  the commit that changed it, and says that the runs used the earlier page.
