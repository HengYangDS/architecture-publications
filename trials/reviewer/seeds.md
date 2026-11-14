# Seeded checks of the reviewer's procedure

Version 2, 2026-11-14. Each part was written before its own first run; see E2b for what version 2 changed. A holder passes these checks before it may take the reviewer's
role. They measure whether the procedure finds what it should; they do not measure independence, and a holder that
passes can still miss a kind of fault nobody thought to seed.

## E2a: false statements

Subject: one work at its pin, with false statements planted by a seed author who reads the repository at the pin.
The reviewer receives the seeded work's delivery and a checkout at the pin, follows the procedure, and returns its
verdicts. It is not told how many statements are false or of which classes.

| Class                 | A seed of this class                                                              |
| --------------------- | --------------------------------------------------------------------------------- |
| `wrong-claim`         | A component claims a file that belongs to another component's work.               |
| `reversed-relation`   | A relation is drawn against the direction the code shows.                         |
| `irrelevant-citation` | A relation cites a file that exists at the pin and shows nothing of the relation. |
| `false-detail`        | A component's or relation's detail says something the cited files contradict.     |
| `false-sentence`      | A sentence of the guide carries a citation whose lines do not say it.             |

Three seeds of each class, fifteen in all, in a work whose other statements are left as published.

Scoring, by script against the seed author's key: a seed is found when the reviewer gives it `not supported`; a
`cannot tell` on a seed is a miss. A false alarm is an unseeded statement given `not supported`.

Pass line, set before the run and without precedent: at least 12 of 15 seeds found, at least 2 of 3 in every class,
and false alarms on at most 10 percent of the unseeded statements judged. A false alarm that two holders of
different origin both raise is not counted against either; it is listed as a candidate defect of the published work.

## E2b: defects of form

Revised to version 2 on 2026-11-14, before any run of E2b; E2a ran under version 1 and is unchanged. What
changed: the class "a line's end touching caption text" is not seeded, because no per-plate ground truth exists
for it (the earlier count came from readers of the plates, not from a measure); and scoring is by plate and class,
since most plates of the current release miss a balance gate and few are free of every class.

Subject: sixteen plates of three Chinese works, eight built by release 0.13.1 and eight by 0.14.0 from the same
models, under neutral file names in a shuffled order. The defects are real: each is one the owner pointed out and a
later release corrected, or one the current release still has and a measure or the model records.

| Class            | Ground truth of a plate                                                                                                           |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `key-off-line`   | Built by 0.13.1: a key mark stands off its label's line, and the hub's sample line reads as an underline. Corrected in 0.14.0.    |
| `lone-character` | Built by 0.13.1 and listed by the probe of 2026-11-14: one Han character alone on the last line of a detail. Corrected in 0.14.0. |
| `open-boundary`  | The system boundary lacks a side. The seed author confirms each instance on the image.                                            |
| `colour-only`    | The view has a hub: the lines into it differ from the others by colour alone. Both releases.                                      |
| `blank-area`     | The manifest records that the plate misses the gate on its largest blank rectangle or on a blank band.                            |

The reviewer receives each plate at the base condition and enlarged, with the list of the five classes and their
one-line descriptions, and no key. For every plate it names the classes it sees, each with where on the plate.

Scoring, by script against the seed author's key, over the eighty pairs of plate and class: a positive pair is
found when the reviewer names that class on that plate. Pass line, set before the run and without precedent: in
every class at least two thirds of the positive pairs found; and at most one negative pair in five named.

## Holders

Each check is run by two holders of different origin: an agent of the model that builds the product, in a session
that has not seen the author's work, and an agent of another vendor's model run headless and read-only. Where their
verdicts on a statement differ, the statement goes to the list for a judgement by a human reader.

## What happens on a failure

A holder below a pass line does not hold the role. If no holder passes, the procedure is at fault and is revised,
with a new version and a new run; no acceptance record is issued meanwhile.
