# Figure-reading check: items and key

Version 1, 2026-11-14, written before any holder was shown a plate of the comparison. It is the check that
[the definitions](definitions.md) name in their last line: the same items on every cell at every condition.

## What is read

Plate 05 of the Chinese work on Architecture Publisher, the view `edition`, as each cell built it: four cells at three image widths, twelve images. The reader gets one image
and the items below, and nothing else: no model, no source, no other plate, no other cell.

## Items

The same eight for every image, in Chinese because the plate is. The key is taken from the model the plate was built
from (its Chinese model's view `edition` at the work's pin of that day), not from any image.

| Item | Asked                                                  | Key                                  |
| ---- | ------------------------------------------------------ | ------------------------------------ |
| 1    | 这幅图里，汇入关系最多的组件（枢纽）是哪一个？         | 物料                                 |
| 2    | 哪些组件有关系直接通向这个枢纽？列出全部。             | 字体、类型与图标、版式类与总览、图册 |
| 3    | 「图版编排器」到「类型与图标」的关系引用了几个源文件？ | 4                                    |
| 4    | 「图版编排器」到「用语」的关系引用了几个源文件？       | 3                                    |
| 5    | 「图册」到「Typst」的关系引用了几个源文件？            | 2                                    |
| 6    | 从「交付物构建器」出发的关系有几条？                   | 4                                    |
| 7    | 哪些组件有关系直接通向「用语」？列出全部。             | 图版编排器、图册                     |
| 8    | 图中有没有画成「计划中」或「已退役」的关系？           | 没有                                 |

Items 1 and 2 test how the hub is told apart (colour alone, a wide line, a mark on the part). Items 3 to 5 test how
cited files are shown (ticks, a number). Items 6 to 8 are the same task in every cell and show whether a difference
between cells is the cell or the reader.

## Answers and scoring

The reader replies with one JSON object, keys `"1"` to `"8"`: a part's name, a list of names, a number, or
`"有"` / `"没有"`; `"看不清"` where it cannot tell. An item is right when a name equals the key, a list holds exactly
the key's names in any order, a number equals the key, and item 8 says `"没有"`. `"看不清"` is not right and is
counted on its own. A reply that is not such an object voids the reading; it is run once more, and a second void
stands.

Reported per image and holder: items right of eight, and which were wrong or not told. Reported per cell and
condition: the items right over all holders and runs.

## Holders

Two origins, each a fresh session per image with no memory, three readings per image:

- A headless Claude session whose room, outside the home directory, holds the image and the items, with reading
  tools only.
- A Codex session given the image as an attachment and the items as its prompt, read-only.

## What the check can and cannot say

It says whether an agent reader takes the same facts from each cell at each condition. It is not a measurement of
what a person sees: both holders read an image through their own resampling, which the conditions do not control
(a 2400 px image may reach the model smaller than it is). It tests one plate. No pass line is set: the readings sit
beside the measured widths and pitches, and the choice between cells is made on both.

## Where these rules stood before the readings

This file was not committed here before the readings, as the trials' other rules were. Its text was fixed in a
working file whose SHA-256, `c9324bd5d6a310ab6bae338782818f86444aa83a19c13fc0dd493e4716e32333`, was recorded at
23:57 CST on 2026-11-14, before any holder was shown a plate. Since then a formatter re-aligned the table of items
and this section and the next were added; the items, the key and the scoring are word for word what was fixed.

## Deviations

- 2026-11-14 23:58 CST. The first start of the Codex holder read nothing: the script put the prompt after
  `-i`, which takes every following word for an image, so each of the twelve sessions ended in two seconds with
  exit 1 and no reply, twice. No plate was shown. The
  script now puts the prompt first and keeps a failed session's error output. The Claude holder's readings were not
  affected. The corrected script is the one named in the trials' index.
