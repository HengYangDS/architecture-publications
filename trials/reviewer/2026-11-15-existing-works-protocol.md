# Review of the existing works, once, under the reviewer's procedure: protocol

Version 1, 2026-11-15 09:30 CST, written before any session of this review was started. It carries out what the
design of the queue asks of the roadmap's first step and what was left out when that step was closed: "After E2 is
passed, the four existing works are reviewed once under the current procedure. The review may accept or refuse,
takes one day at most and belongs to the publications side; defects found go to the queue and are not fixed in
place."

## What is reviewed

The Chinese editions of the six works of the publications at `dev` 9fbcda1, each at its pin: `aigw-client`,
`architecture-publisher`, `ddwg`, `ethos`, `filmkit`, `openai-responses-proxy`. The design says four; the
publications hold six, and all six are reviewed. The English editions are not reviewed.

## Which steps of procedure version 1 are done, and by whom

1. Bytes: by the queue's holder, with `archpub verify` on a delivery of each work built from the same inputs.
2. Statements: by the reviewer, in full. This is the review.
3. Questions: not done. No work marks an entry of the question table as answered or silent; that comes with the
   model's next version. The matrices filled in the first step stand in its place for three works.
4. Form: not done. No holder passed the seeded check of form; the procedure admits no holder for it.
5. Cannot judge: the reviewer lists what it could not decide.

So a record of this review judges statements only, and says so. It is no acceptance of a delivery.

## The reviewer

One holder: headless Codex (`codex exec`, the host's configured model), of another origin than the works' author
(Claude), which found fifteen of fifteen seeded false statements on 2026-11-14. Each work is read in two sessions
that share nothing: one for the model's statements, one for the guide's. A session is given a room that holds
`work/` (the work's `model.json`, `overview.typ` and `guide/`, the publications' bytes), `repository/` (the
described repository's files at the pin, exported from Git, with no history and nothing later), the procedure's
bytes and its task. It is not given the author's session or notes, an earlier review, the question matrices, or the
list of statements gathered for the sample book. The file system does not enforce the room; the session runs with
the host's Codex configuration.

## Verdicts and what follows

A verdict is `supported`, `not supported` or `cannot tell` with its reason, as the procedure defines them. Each
session hands over one JSON record with its counts and every statement not judged `supported`.

- Every `not supported` is read against the pin by the queue's holder before it is counted: confirmed, or returned
  as the reviewer's misreading with the lines that show it. Both are recorded.
- By the procedure one confirmed `not supported` refuses the work.
- Confirmed defects and unresolved candidates go to the publications' queue for the item `six-works`, each with
  the statement, the cited lines and what they say. Nothing is corrected in place.
- A session that ends without a record is run once more; a second failure stands and is recorded.

## Deviations from the procedure, known beforehand

The reviewer is given the work's inputs and not the delivery directory, as in the seeded check it passed. The
sentences of `overview.typ` carry no evidence, so they get no verdict; the guide's session lists each one that says
more than, or other than, the work's statements.
