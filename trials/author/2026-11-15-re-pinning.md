# Author's timing: record of the re-pinning part

Run of 2026-11-14 23:46 to 2026-11-15 01:16 local time under version 1 of [the protocol](2026-11-14-protocol.md). A fresh holder,
model `claude-opus-5-5` as its stream names it, got the room as the writer left it and was told to move the work
from f5e85f3983a2e6d6d0d36052de04a94d499d83c3 to the clone's head, 7e06519357777badd7a115d2014a7ef845904310,
thirty first-parent commits later.

## Result

The part reached its ninety-minute limit and is recorded as unfinished: no edition and page were delivered, and no
build was run. The work the holder left is pinned at the head and passes `archpub check` with its guide (run by the
keeper after the limit).

| Measure                       | Value                                                                                                                                                                             |
| ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Wall-clock minutes            | 90.0, the limit                                                                                                                                                                   |
| Tool calls                    | 142 (102 shell, 37 edits, 3 reads)                                                                                                                                                |
| Requests to the model         | 102                                                                                                                                                                               |
| Tokens                        | 779,136 written to the cache and 13,852,728 read from it, summed from the stream; the stream ended without a result event, so the agent's own cost and output count are not known |
| `archpub check` runs          | 4, of which 2 did not pass                                                                                                                                                        |
| `archpub build` runs          | none                                                                                                                                                                              |
| `archpub scaffold guide` runs | 2, of which 1 gave no answer in the shell tool's two minutes                                                                                                                      |
| Refusal codes                 | `explainer/schema-maxItems`, once: the guide's answer held more than four reasons                                                                                                 |
| Delivered                     | no                                                                                                                                                                                |

Of the two checks that did not pass, one was refused by the product as above and one never reached it (the
holder's shell refused the command line as written).

## The worklist the holder was given

`archpub check --against` at the start of the part:

| Measure                                         | Value             |
| ----------------------------------------------- | ----------------- |
| Commits since the pin                           | 30                |
| Cited files unchanged, modified, moved, deleted | 19, 27, 0, 0      |
| Files newly without an owner                    | 6                 |
| Guide citations the same, shifted, touched      | 17, 10, 27, of 54 |

Half the guide's citations had to be reread, and six new files had to be given an owner. The protocol asks how many
citations the holder reread; the holder ended without its closing message, so that count is not known.

## The work as left

Pinned at the head. `archpub check` reports: sources verified (52), coverage 52 of 52 files in scope owned and none
uncovered, 160 files excluded with reasons, no warning; the same three components cite no file as after the
writing part. The six new files have owners. Whether every touched citation was reread is not established: the
check proves that each cited range exists at the pin, not that its sentence was read again.

## Where the time went

| Minutes from the start | What happened                                                                                                                                   |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| 0 to 11                | Read the Skill; the first check with the worklist (0.4)                                                                                         |
| 11 to 34               | Read the archive's own source and Skill again to learn how a guide's diagrams are kept; a `scaffold guide` gave no answer in two minutes (33.8) |
| 34 to 70               | Moved the model and rewrote the guide panel by panel, 37 edits                                                                                  |
| 70 to 79               | A check with the guide, refused for a fifth reason in the answer (70.7); the answer cut to four                                                 |
| 79 to 90               | `scaffold guide` for the updated model (79.2, answered after five minutes); about to run the full check; limit                                  |

## Read with the writing part

Neither part delivered in ninety minutes. Writing stalled on making a view fit a plate; re-pinning never reached a
plate and went to rereading and rewriting the guide by hand. On this repository, at this distance (30 commits, 27
of 46 cited files changed), moving a work cost at least as much as writing it. The publisher lists a shifted
citation's new range but has no command that applies it; the ten shifted ranges, like the twenty-seven touched ones,
were the holder's to edit.

## Unproved

- How much of the ninety minutes the ten shifted ranges took, and how many of the twenty-seven touched citations
  were reread.
- Whether a smaller move would finish. The works on the shelf are moved one release at a time, where far fewer
  citations are touched (10 of 187, 1 of 126 and none of 143 for the three works moved on 2026-11-15).
- One repository, one holder, one run: a first number, not a rate.

## Follow-ups this record raises

- A command that applies a worklist's shifted ranges, so that a holder reads only what changed in substance.
- `scaffold guide` and `check` each took more than two minutes at least once; neither says what it is doing.
- The page's limit of four reasons in an answer is found only by a full check with the guide; the Skill could say it
  where it describes the answer.
