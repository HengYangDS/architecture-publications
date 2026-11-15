# Figure-reading check on the rebuilt plate 05: record

Readings of 2026-11-15, 06:45 to 06:48 CST, after [the pass line](2026-11-15-figure-reading-pass-line.md) was
committed here at 05:53:50 CST (commit `7d341b0`). Plate 05 of the Chinese work on Architecture Publisher at its pin
`4be4dd7`, built by the lane of the roadmap's item `line-table` with heavy lines into the hub, cited files as
numbers and the figure in its square canvas. Two holders, a fresh session for every image, three readings of every
image: eighteen readings, none void. The answers are in
[the readings file](2026-11-15-rebuilt-plate-readings.json); the scripts that read and scored are named by digest
in [the index](../README.md).

| Image                 | SHA-256                                                            |
| --------------------- | ------------------------------------------------------------------ |
| `05-edition.png`      | `f95111d119e477e691bad207e196410f2f3e2407945695252ca2f45003cf6677` |
| `05-edition-1920.png` | `1b7aacc53da7a1267493e19d0a525c47fc9d3c42dee63402d61799d967bb6641` |
| `05-edition-960.png`  | `07f9ed980f86d74e61bd004917ce4dbefdc4f24344a33539d14654a0f97e90d3` |

## Result against the line

| Items                                | Asked | Right | Line |             |
| ------------------------------------ | ----- | ----- | ---- | ----------- |
| 1 and 2, the hub                     | 36    | 34    | 35   | **not met** |
| 3 to 5, cited files as a number      | 54    | 54    | 50   | met         |
| 6 to 8, the same task on every plate | 54    | 54    | 51   | met         |

| Holder | Width, px | The hub | Cited files | The same task |
| ------ | --------- | ------- | ----------- | ------------- |
| Claude | 960       | 6 of 6  | 9 of 9      | 9 of 9        |
| Claude | 1920      | 6 of 6  | 9 of 9      | 9 of 9        |
| Claude | 2400      | 6 of 6  | 9 of 9      | 9 of 9        |
| Codex  | 960       | 4 of 6  | 9 of 9      | 9 of 9        |
| Codex  | 1920      | 6 of 6  | 9 of 9      | 9 of 9        |
| Codex  | 2400      | 6 of 6  | 9 of 9      | 9 of 9        |

## The two answers that were not right

Both are item 2 (which parts lead into the hub), both from the Codex holder, both at 960 px. Each lists four parts,
and three of the four names are the key's. The fourth is the key's part 「版式类与总览」 with one character of its
name wrong in one reading, 「版式壳与总览」, and left out in the other, 「版式与总览」. The scoring fixed beforehand asks
for exactly the key's names, so both count as wrong. Every one of the eighteen readings named the hub itself, 物料,
and at 1920 and 2400 px every answer of every item was right (96 of 96).

The same name was misread by the same holder in [the comparison](2026-11-15-comparison.md): once of three readings
in each of two cells at 960 px. Part names are 7.2 px high at that width.

## What the registered rule says, and why the result was put to the owner

The pass line's text: items 1 and 2 below their line means that emphasis as line width leaves the table of lines,
and lines into the hub are drawn as every other line until another way is tested; the line is not moved after a
reading.

By that text the row leaves. The session that builds the product did not apply this on its own and did not set it
aside either:

- The row is the owner's own: the owner asked for lines into the hub at twice the width and confirmed it.
- The line, as that session wrote it, counts the readings at 960 px. [The screen trial's definitions](definitions.md),
  registered earlier, say of that width "measured and recorded, never a stop line". The line contradicts them, and
  the session did not see that when it wrote the line.
- The committee that designed the roadmap named this very move as a likely failure: a line is missed and the miss
  is explained as a fault of the experiment. Only the owner can decide that the registered consequence does not hold
  here.

## The owner's ruling

Two ways were put to the owner: keep emphasis, recording the miss and that keeping it is the owner's ruling, which
the session recommended; or apply the registered consequence and take the row out. On 2026-11-15 at 09:45:59 CST the
owner answered: 「保留加粗，line-table 落地了告诉我」.

- The `emphasis` row stays in the table of lines. It stays by the owner's decision and not because it passed: the
  hub's items remain 34 of 36 against a line of 35, and the line is not moved.
- The registered consequence is set aside for this row by the owner. Nothing else of the pass line changes.
- Architecture Publisher says so where a reader meets the row: in the queue's entry of `line-table` in its product
  contract and in its reference of the lines.
- Not decided by this ruling: whether a line may count readings at 960 px. A later check that sets a line states
  which widths count before it is committed.

## The scripts

`read-rebuilt.py` was last written at 06:44:35 CST, before the first reading at 06:45:06. `score-rebuilt.py` was last
written at 06:48:21, after the last reading ended at 06:47:59. Its key, its groups of items and its rule of what is
right are word for word those of `score-figure.py`, the scorer of the comparison, and it adds the three numbers of the
pass line. Both are named by digest in [the index](../README.md).

## What the check does and does not say

Agents of two origins took the same facts from the rebuilt plate as the key holds, at every width for the counts
and the unchanged items, and at 1920 and 2400 px for the hub. It says nothing of what a reader who is not an agent
sees, and it read one plate of one work.
