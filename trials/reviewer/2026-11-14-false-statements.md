# E2a run of 2026-11-14

Procedure version 1, seeds version 1 (`procedure.md`, `seeds.md`), both written before the run. Subject: the
Chinese work on Film Kit at its pin `3824247` (v0.21.2) with fifteen seeds planted by a seed author that read the
repository at the pin. Scoring by
`score-false-statements.py` (see [the trials' index](../README.md)) against `2026-11-14-false-statements-key.json`; the seeds are
`2026-11-14-false-statements-seeds.patch` against the published work, and each holder's verdicts stand beside
this record.

| Holder                            | Origin                            | Judged                                     | Seeds found | By class            | False alarms counted | Result |
| --------------------------------- | --------------------------------- | ------------------------------------------ | ----------- | ------------------- | -------------------- | ------ |
| Claude (Fable 5.2), a fresh agent | the model that builds the product | 28 components, 55 relations, 87 sentences  | 15 of 15    | 3 of 3 in each of 5 | 3 of 155 (1.9%)      | pass   |
| Codex (GPT-6), headless           | another vendor's model            | 28 components, 55 relations, 113 sentences | 15 of 15    | 3 of 3 in each of 5 | 3 of 181 (1.7%)      | pass   |

Codex also answered `cannot tell` on 24 statements; Claude on none. Codex took 43 minutes, Claude 10.

## What the result does and does not show

- Both holders find every seeded false statement of the five classes when they follow the procedure.
- The three reversed relations had a tell the seed author reported: every relation id of this model is
  `<from>-<to>`, so a reversal contradicts its own id. For that class the run shows less than for the others.
- The check measures detection of what was seeded. It does not measure independence, nor detection of kinds of
  fault that were not seeded.

## Statements both or one holder refused outside the seeds

| Statement                            | Refused by | What the holder found                                                                                                     |
| ------------------------------------ | ---------- | ------------------------------------------------------------------------------------------------------------------------- |
| component `delivery`, a detail       | both       | A side effect of seed 1: the detail describes the file the seed moved away. Not a defect of the published work.           |
| component `alignment`, a detail      | Claude     | The detail says the transcript is a proxy for recognition; the file says recognition is a proxy for pronunciation.        |
| guide, source `produce-actions`      | Claude     | True, but said in another file than the cited lines.                                                                      |
| component `picture-audits`, a detail | Codex      | The detail says every uncaptioned frame is compared; the code compares caption starts, middles, ends and a periodic grid. |
| guide, source `sample-declaration`   | Codex      | The sentence assigns more to the film's declaration than the cited sample lines show.                                     |
| guide, source `delivered-check`      | Codex      | The sentence says every track carries the edition's language; the code exempts the attached cover.                        |

The five rows after the first are candidate defects of the published work on Film Kit. Each was raised by one holder
only, so by the procedure they go to the list for a reader's judgement, and into the publications' queue as
candidate corrections. They are not corrected in place.

## Isolation as it was

The holders were given one directory with the seeded work and a checkout at the pin, and told to read nothing else.
The file system did not enforce it. The Codex holder ran with the host's Codex configuration, hooks and tools, and
the Claude holder as an agent of the building session's application; neither was given this record, the key or the
author's notes. The validity check of the seeded model by the publisher had not returned when the holders ran.
2026-11-14 21:12 CST: the publisher's validity check of the seeded model was withdrawn from the host queue unrun; both holders had already judged the work, and eleven tickets stood in the queue.
