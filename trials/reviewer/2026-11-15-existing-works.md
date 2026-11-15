# Review of the existing works under the reviewer's procedure: record

The review that Architecture Publisher's roadmap asks of its first step and that was left out when the step was
closed here ("After E2 is passed, the four existing works are reviewed once under the current procedure"). Its
[protocol](2026-11-15-existing-works-protocol.md) and the two tasks the reviewer was given
([the model's](2026-11-15-existing-works-task-model.md), [the guide's](2026-11-15-existing-works-task-guide.md)) were
fixed in working files before any session read a work, and are committed here with this record, byte for byte: their
SHA-256 were recorded at 09:18:57 CST and the runner's at 09:19:47; the first sessions began at 09:20. The
protocol's first line says "09:30 CST": that time was an estimate written into it and is wrong; the file is kept as
it was registered.

**What this is and is not.** Step 2 of procedure version 1, statements, for the Chinese editions of the six works at
their pins, at this repository's `dev` 9fbcda1. Bytes, questions and form were not reviewed (the protocol says why).
It is no acceptance and no refusal of a delivery: by the procedure one statement `not supported` refuses a work, and
every work has such statements; what the owner does with that is the owner's.

## The reviewer's verdicts

One holder of another origin than the works' author: headless Codex, twelve sessions (model and guide of each
work), started 09:20 CST on 2026-11-15, 237 minutes of session time in all, every session's first attempt
delivered its record, and no session changed the work it was given. The records as returned are in
[the verdicts file](2026-11-15-existing-works-verdicts.json).

| Work                   | Statements judged | Supported | Not supported | Cannot tell |
| ---------------------- | ----------------- | --------- | ------------- | ----------- |
| AIGW                   | 268               | 172       | 51            | 45          |
| Architecture Publisher | 380               | 301       | 57            | 22          |
| the work guidelines    | 295               | 214       | 27            | 54          |
| ETHOS                  | 384               | 285       | 61            | 38          |
| Film Kit               | 347               | 221       | 67            | 59          |
| OpenAI Responses Proxy | 322               | 196       | 83            | 43          |
| **All six**            | **1996**          | **1389**  | **346**       | **261**     |

"Cannot tell" is, in nearly every case, a sentence of the guide that states a fact and carries no source marker.

## What the findings are: confirmation against the pin

Each `not supported` finding was read against the same files by an agent of the author's origin, told to take the
worse class when in doubt and to say so; nothing was left unread. Each finding with its class, what the work says
and what the pin says is in [the confirmation file](2026-11-15-existing-works-confirmation.json).
Classes: `wrong`, the work says what the pin contradicts or what is found nowhere, or drops a condition; `citation`,
true at the pin and said outside the cited lines; `precision`, more exact than any file given holds; `misread`, the
reviewer read the cited lines wrongly.

| Work                   | Wrong  | of which doubted | of which only a day's difference (see below) | Wrong, the day set aside | Citation | Precision | Misread | Overview sentences wrong |
| ---------------------- | ------ | ---------------- | -------------------------------------------- | ------------------------ | -------- | --------- | ------- | ------------------------ |
| AIGW                   | 14     | 8                | 1                                            | 13                       | 25       | 12        | 0       | 5 of 20                  |
| Architecture Publisher | 21     | 16               | 0                                            | 21                       | 27       | 9         | 0       | 7 of 21                  |
| the work guidelines    | 4      | 4                | 0                                            | 4                        | 12       | 11        | 0       | 8 of 13                  |
| ETHOS                  | 24     | 12               | 1                                            | 23                       | 26       | 11        | 0       | 9 of 24                  |
| Film Kit               | 15     | 10               | 2                                            | 13                       | 35       | 16        | 1       | 2 of 7                   |
| OpenAI Responses Proxy | 14     | 11               | 3                                            | 11                       | 58       | 11        | 0       | 5 of 10                  |
| **All six**            | **92** | **61**           | **7**                                        | **85**                   | **183**  | **70**    | **1**   | **36 of 95**             |

The reviewer was right in 345 of 346 findings that something is not as cited. What is wrong in substance is the
smaller part: most findings are true statements whose cited lines hold half of them.

## A correction by the queue's holder: the timelines' times are tag times

The confirmers classed 70 timeline events as `precision` (a time of day no file holds) and seven more as `wrong`
only because the event's day is one later than the changelog's. The rooms held the files at the pin and no Git
history, so neither the reviewer nor the confirmers could see this: **each of the 86 events of the six works'
timelines carries the creation time of a tag of the described repository, to the second** (checked with
`git for-each-ref refs/tags` in the six repositories on 2026-11-15). The times are measured. What the findings
really show:

- A release's time is a fact of a tag, and a work cannot cite a tag: each event cites lines of the changelog, which
  hold a date only. These 70 are not defects of content; they are evidence of a kind the model lacks.
- In seven events the tag was created after midnight (+08:00) and the changelog's heading carries the day before
  (AIGW 0.4.17; ETHOS 0.2.0-alpha.8; Film Kit 0.19.0 and 0.21.0; the proxy 1.0.43, 5.1.10 and 5.1.12). Two facts of
  the repository disagree, and the timeline shows one while citing the other. The work should show both with their
  sources.
- This session told the owner at first that "history written by hand had drifted". That was wrong and was
  corrected the same morning.

Two further AIGW events (0.7.1, 0.7.2) differ by a day and also drop conditions the changelog states; they stay
`wrong` for the conditions.

## The holder's own checks

Three findings were read by the holder against the pin: Film Kit's model lists twelve actions of the production
command and `EDITION_ACTIONS` in `src/filmkit/produce.py` at the pin holds fifteen (`fit`, `render-draft` and
`repair-pictures` are missing): confirmed. The proxy's 5.1.12 and ETHOS's alpha.8: the tag times, as above. The
other findings rest on the reviewer and one confirmer each.

## What repeats

- A universal ("every", "always", "never", 一律, 绝不) where the source has a condition: the largest group of the
  wrong statements (13 of the publisher's 21, 6 of the proxy's 14).
- A sentence with two clauses and one marker: the cited lines hold one clause.
- A diagram node whose cited lines show the call and not the thing the node's sublabel says.
- An overview's sentence that drops a qualifier the guide keeps: an overview carries no citations, so nothing holds
  it to the guide.

## What it does not cover

The English editions; the 1389 statements judged supported, which no second reader read; whether a supported
statement is the right thing to say; form; the questions; bytes. The confirmers are of the author's origin. 61 of
the 92 `wrong` classes were taken on doubt as the worse of two.

## What follows

Nothing is corrected in place. The findings go to the publications' queue for `six-works`, by work, with the
statement, the cited lines and what the pin says (the confirmation file). Two things go to the product's queue:
a work has no way to cite a tag (`model-four`, the kinds of evidence), and an overview's sentences are held to
nothing (`blocks-by-question`).
