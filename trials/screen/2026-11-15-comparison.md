# Screen comparison: record

Measured and read on 2026-11-14 and 2026-11-15 under [the definitions](definitions.md) (version 1) and
[the figure-reading check](2026-11-15-figure-reading.md) (version 1). One plate, plate 05 of the Chinese work on Architecture Publisher, in four cells at three
image widths. The reading check's deviations are in its own file.

## Line widths

Each line's place is taken from the vector page and the pixels are sampled there. A first measurement, which
scanned the image for a line's colour, counted text strokes as dashes and is superseded; its numbers are not used.

| Line                          | 2400 px  | 1920 px (base) | 960 px (half)             |
| ----------------------------- | -------- | -------------- | ------------------------- |
| relation, effective / core    | 1.50 / 1 | 1.25 / 1       | 0.64 / 0                  |
| line into the hub, `present`  | 1.50 / 1 | 1.25 / 1       | 0.63 / 0                  |
| line into the hub, `wide-hub` | 3.25 / 3 | 2.50 / 2       | 1.25 / 1                  |
| system boundary, dash / gap   | 8 / 5    | 6 / 4          | 2 / 3, on one side of six |

By the rule fixed beforehand (effective widths 1.0 px apart and core widths 1 px apart):

- In `present` a line into the hub and any other line have the same width at every size: colour alone tells them
  apart.
- In `wide-hub` they are distinguishable at base (2.50 against 1.25, core 2 against 1) and enlarged, and not at half
  size (1.25 against 0.64, 0.61 apart). The stop line is at base, so **the width channel may be used**.
- The dashed boundary is distinguishable from a continuous line at base and enlarged. At half size five of its six
  runs show no dash at all.
- The hub's mark in `marked-hub` is 8 px square at base and 4 px at half size.

## Reading

Two holders (a headless Claude session, a Codex session), three fresh readings of every image each, 72 readings,
none void. Items right, of those asked:

| Cell               | Hub items (1, 2) | Citation items (3 to 5) | Items that are the same task everywhere (6 to 8) |
| ------------------ | ---------------- | ----------------------- | ------------------------------------------------ |
| `present`          | 35 of 36         | 28 of 54                | 51 of 54                                         |
| `wide-hub`         | 36 of 36         | 28 of 54                | 51 of 54                                         |
| `marked-hub`       | 36 of 36         | 32 of 54                | 51 of 54                                         |
| `citation-numbers` | 35 of 36         | 54 of 54                | 54 of 54                                         |

- **The hub is found in every cell at every size** (142 of 144; the two misses are one part's name misread at half
  size). How the hub is marked makes no difference to these readers.
- **Numbers are read; ticks are not.** With ticks the citation items are right 88 times in 162, with numbers 54 in
  54, at half size too. The two holders differ: Codex counts ticks right 76 times in 81, Claude 12 in 81 and says it
  cannot tell 58 times. No cell and no size makes ticks readable for that holder.
- At half size the Claude holder misses one of the two relations into 用语, or cannot tell, in all 9 readings of
  the cells with ticks and in none of the 3 with numbers.

## Text sizes

From the vector page: 57 of the plate's 125 words, the details and the relation
labels, are set at 14 px in the plate's drawing space, which is 11.2 px at base and 5.6 px at half size. The
typography seat's initial line for Han text is 12 px, so at base nearly half the words stand under it; they reach it
at an image width of 2057 px. Part names are 14.4 px at base. Both agent holders read the 5.6 px text at half size,
which says nothing of a person's reading.

## Found on the way

A straight piece of a line that falls exactly on a pixel boundary is drawn at a third of its weight or not at all.
On this plate two vertical pieces stand at x = 1200.00 of 2400: at 2400 px they measure 0.49 where every other piece
measures 1.50 to 1.75, and at 960 px one of them is not drawn in three of the four cells. At 1920 px they are as
the others. The published 0.14.0 plate has this. Seen in the pixels and on the image.

## What follows for the line table

The queue's `line-table` item admits only rows that passed here.

| Row                                   | Verdict                         | On what                                                                                              |
| ------------------------------------- | ------------------------------- | ---------------------------------------------------------------------------------------------------- |
| Emphasis as width, two steps (1 : 2)  | admitted                        | distinguishable at base and enlarged by the rule set beforehand; the owner asked for twice the width |
| Hub told by colour alone              | not admitted                    | no difference in width at any size; the invariant "never by colour alone"                            |
| A mark on the hub part                | not needed                      | adds nothing a reader used here, and gives the oldest dye a second meaning                           |
| Cited files as a number               | admitted, in place of ticks     | read right 54 times in 54 against 88 in 162                                                          |
| Ticks                                 | withdrawn                       | one of two holders cannot count them at any size                                                     |
| Dashed system boundary                | admitted at base and above      | 6 / 4 px at base; lost at half size, which is recorded and stops nothing                             |
| Every piece of one kind at one weight | to be added as a test on pixels | the pieces on a pixel boundary above                                                                 |
| Smallest type 14 px                   | open                            | 11.2 px at base against an initial line of 12 px that no reader has tested                           |

## Limits

One plate of one work. Readers are agents, which see an image through their own resampling; the plates serve
people first, and no person has read these cells. The width and legibility lines were initial values of committee
seats. The prototype trees were never run against the repository's tests. Three widths, one renderer.

## Files

[The readings](2026-11-15-figure-readings.json) hold every holder's answers. The measuring script and its output are
named by SHA-256 in [the trials' index](../README.md).
