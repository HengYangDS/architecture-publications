# Reviewer's check, defects of form: record

Runs of 2026-11-14 22:27 to 2026-11-15 00:19 CST under version 2 of [the seeded checks](seeds.md) and
[the brief](2026-11-15-defects-of-form-brief.md) the holders were given. Sixteen plates of three works, eight built by 0.13.1 and eight by 0.14.0, each as one
whole image and four tiles; five classes; eighty pairs of plate and class, of which the seed author's key marks 32
positive and 48 negative ([the key](2026-11-15-defects-of-form-key.json)).

## Result

Pass line, set before the run: in every class at least two thirds of the positive pairs found, and at most one
negative pair in five named.

| Class                       | Positive pairs | Codex found       | Claude found      |
| --------------------------- | -------------- | ----------------- | ----------------- |
| `key-off-line`              | 8              | 5, below the line | 8                 |
| `lone-character`            | 2              | 2                 | 2                 |
| `open-boundary`             | 2              | 2                 | 2                 |
| `colour-only`               | 9              | 9                 | 6                 |
| `blank-area`                | 11             | 9                 | 5, below the line |
| Negative pairs named, of 48 |                | 2                 | 0                 |
| Verdict                     |                | fail              | fail              |

**No holder passes.** Each fails one class, and not the same one.

## What each missed

- Codex found `key-off-line` on the five plates whose key has a hub sample standing under its label like an
  underline, and on none of the three whose only fault is the samples standing 3 px below the middle of their labels
  (plates 05, 06, 12).
- Claude found all eight of those, and missed six of eleven blank areas (plates 05, 07, 08, 09, 14, 16) and three
  of nine hubs told by colour alone (09, 15, 16).
- Both missed the blank band of plates 09 and 16 (112 px against a limit of 96).
- Codex named a blank area on two plates that have none by the key (01, 15).
- The two together find 30 of the 32 positive pairs.

The table of every plate is at the end.

## How it was run, and where that departs from the plan

- Codex (model `gpt-6.1-sol` as its log names it): one session over all sixteen plates, allowed to write in its
  room only, 2026-11-14 22:27 to 22:38.
- Claude: a first session over all sixteen plates read the eighty images and then got no answer from its last
  request for an hour, until the gateway cut it; nothing was kept. The holder was run again as four sessions of four
  plates each, with the brief's own bytes and a covering note naming the two differences (four plates of sixteen;
  the answer as the final reply, since the session cannot write). One of the four timed out after an interrupted
  request and was run once more. A holder that sees four plates at a time cannot compare a plate with twelve others;
  whether that helped or hurt it is not known. The script is named in [the trials' index](../README.md).

## What follows

The line is not lowered and no holder is admitted to review form by eye. The procedure changes instead:

- Every class seeded here has a number or a fact behind it that a program can read from the build: a mark's offset
  from its label, a blank rectangle's share (the key's `blank-area` is the manifest's own `misses`, which the
  reviewers' eyes agreed with 9 and 5 times in 11), a boundary's sides, the widths and colours of the lines into a
  hub, a last line of one character. A reviewer's eye is the wrong instrument for these.
- The form half of the reviewer's procedure therefore starts from what the build reports and measures, and a
  reviewer judges only what no measure decides. The measures belong to the queue's `line-table` and `one-anatomy`
  items as tests on the built plates; the procedure belongs to `roles-and-records`. The seeded check is run again
  when they exist, on plates no holder has seen.
- Review of what a work says is not affected: both holders passed the check on false statements
  ([record](2026-11-14-false-statements.md)).

## Limits

Sixteen plates, three works, one seed author, whose key for two classes rests on its own measurements and for
`blank-area` on the product's. Two holders, one run each. The classes are the five the owner or a reader had found
by eye before; a kind of fault nobody thought to seed is not tested.

## By plate

Each cell says whether the pair of plate and class is positive in the seed author's key, and which holder named
the class on the plate. An empty cell is a negative pair that nobody named.

| Plate | Work, plate, release               | `key-off-line`          | `lone-character`        | `open-boundary`         | `colour-only`           | `blank-area`             |
| ----- | ---------------------------------- | ----------------------- | ----------------------- | ----------------------- | ----------------------- | ------------------------ |
| 01    | `ddwg` 5, 0.14.0                   |                         |                         |                         | positive: Codex, Claude | named by Codex           |
| 02    | `ddwg` 2, 0.13.1                   | positive: Codex, Claude |                         |                         | positive: Codex, Claude |                          |
| 03    | `architecture-publisher` 1, 0.14.0 |                         |                         |                         |                         | positive: Codex, Claude  |
| 04    | `ethos` 1, 0.13.1                  | positive: Codex, Claude |                         |                         | positive: Codex, Claude |                          |
| 05    | `ethos` 7, 0.13.1                  | positive: Claude        |                         |                         |                         | positive: Codex          |
| 06    | `architecture-publisher` 3, 0.13.1 | positive: Claude        |                         |                         |                         | positive: Codex, Claude  |
| 07    | `ethos` 7, 0.14.0                  |                         |                         |                         |                         | positive: Codex          |
| 08    | `architecture-publisher` 5, 0.13.1 | positive: Codex, Claude | positive: Codex, Claude |                         | positive: Codex, Claude | positive: Codex          |
| 09    | `ddwg` 4, 0.14.0                   |                         |                         | positive: Codex, Claude | positive: Codex         | positive: missed by both |
| 10    | `ethos` 10, 0.14.0                 |                         |                         |                         |                         | positive: Codex, Claude  |
| 11    | `ethos` 1, 0.14.0                  |                         |                         |                         | positive: Codex, Claude |                          |
| 12    | `ethos` 9, 0.13.1                  | positive: Claude        |                         |                         |                         | positive: Codex, Claude  |
| 13    | `architecture-publisher` 3, 0.14.0 |                         |                         |                         |                         | positive: Codex, Claude  |
| 14    | `architecture-publisher` 5, 0.14.0 |                         |                         |                         | positive: Codex, Claude | positive: Codex          |
| 15    | `ddwg` 5, 0.13.1                   | positive: Codex, Claude |                         |                         | positive: Codex         | named by Codex           |
| 16    | `ddwg` 4, 0.13.1                   | positive: Codex, Claude | positive: Codex, Claude | positive: Codex, Claude | positive: Codex         | positive: missed by both |

The holders' findings as returned: [Codex](2026-11-15-defects-of-form-findings-codex.json),
[Claude](2026-11-15-defects-of-form-findings-claude.json).
The brief is as the holders were given it, but for the alignment of its table, which this repository's formatter
set.
