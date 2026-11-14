# Reader experiment: operating protocol

Version 1, written on 2026-11-14 before any run. It makes the protocol of Architecture Publisher's `docs/roadmap.md`
("Reader experiment protocol") operational. Where the two differ, this file says so.

## Question

Does a cold-start agent that can read a repository predict where a real change lands better when it is also given
the published work on that repository?

## Subjects and rooms

A subject is one headless run of the agent, started with no memory, no Skill, no hook and no tool but Read, Grep
and Glob. Each run gets a room: a directory outside the home directory that holds `repo/`, the repository at the
pin with no Git history, and what its arm adds. Reads of the home directory, of the shared temporary directory
and of the system's own directories are denied by rule; the runner records every tool call and voids a run that
names a path outside its room. A voided run is rerun once.

| Arm | The room holds                                                                                                                 |
| --- | ------------------------------------------------------------------------------------------------------------------------------ |
| A   | `repo/`                                                                                                                        |
| B   | `repo/` and `work/`: the English work as published at that pin, its `model.json`, `overview.typ` and `guide/`                  |
| D   | `repo/` and `page.md`: one page of constraints, processes and decisions, written by a holder that saw only `repo/` and no item |
| C   | `repo/` and `plates/`: the images of the work's plates as built at that pin. Record-only                                       |

The model is the one the host's default headless configuration selects, the same for every arm, and its name is
recorded with every run. Every run has the same budget: the subject is told it has 25 tool calls; a run that makes
more than 30, spends more than one US dollar by the agent's own count, or lasts more than fifteen minutes is void.
The budget was set after one pilot run on the item that is not part of the experiment (`aigw-04`, arm A): told of
no budget, the subject read 60 files in 232 seconds for 1.08 dollars.

## Works and pins

- ETHOS at `999784081fa3` (v0.2.0-beta.9), the pin of the published work.
- AIGW CLI at `abf05858f409` (v0.6.1), the pin the published work held until 2026-11-12, taken from the
  publications' history because its present pin (v0.7.0) leaves four items. This is the fallback of item 4.
- Arm C for AIGW CLI needs plates built from the work at that earlier pin; it is run when they exist.

## Items

`bank/<repo>-items.json`, built from the history after the pin by an item author (`bank/README.md`).
`bank/<repo>-answers.json` holds the answers. A subject is
shown one item's motivation and nothing else of the bank; the bank's items files hold no name of a change.

One rule decides whether a change after the pin is an item: the problem its motivation states must exist in the
repository at the pin. ETHOS gives 13 items under it. AIGW CLI gives 6: the bank holds 7, and `aigw-04` is not run,
because its motivation describes an order of events that a later change introduced. That is two short of the 8 the
roadmap's protocol asks of each work; no weaker item is admitted to reach 8. The 19 items together exceed the 16
the roadmap's protocol counts on, and three runs give 57 answers an arm. Items whose answers are only tests or tooling are in the
bank and are scored; the report gives the result with and without them.

## What a subject is asked

The same words in every arm, with one sentence naming what the arm adds:

> You are about to work on the software repository in `repo/`, one commit with no Git history. A change is planned.
> Its motivation: … Predict which files of `repo/` this change will modify, and which new files it will create.
> Answer with one JSON object and nothing else: `{"paths": [...]}`, at most 12 paths relative to `repo/`, most likely
> first. For a file the change will create, give the path you expect it to have. Read only inside the current
> directory.

## Scoring

By `score-reader.py`, no agent judges. Runs are made by `run-reader.py`. Both are named by digest in
[the trials' index](../README.md).

- The answer of an item is its changed paths without the incidental ones the bank marks (specifications merged at
  the archive, version files, digest manifests).
- A subject's first 12 paths count. A path hits when it equals an answer path. For an answer path the change
  created, a prediction in the same directory also hits it; each answer path is hit at most once.
- An item's recall is hits divided by the smaller of 12 and the number of answer paths. A run's score is the mean
  recall over the items of both works. An arm's score is the median of its three runs' scores.
- Tokens are a run's input and output tokens as the agent reports them, cache reads included.

## Decision

Set before the run; the value 0.15 is the committee's and has no precedent.

- **B passes** when B's score is at least 0.15 above A's, or within 0.05 of A's with at most 70 percent of A's
  tokens. **D passes** by the same rule against A.
- **Undecidable** when the range of A's three runs is 0.15 or more, or when two arms' scores differ by the pass
  line and their three-run ranges overlap. Then eight items are added from the bank's reserve or an earlier pin and
  the experiment runs once more; still undecidable counts as failed.
- A difference below the pass line is a plain fail.
- C never enters the decision.

The consequences of each outcome are the design's.

## Order of work

Pages for arm D are written and fixed before any item is shown to anyone but the item author. Rooms are built by
script. Runs go arm by arm within a run number, A, B, D, then C, so that a fault found early stops the least work.
Every run's raw record is kept, the voided ones too.
