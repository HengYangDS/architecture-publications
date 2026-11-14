# Screen comparison: definitions fixed before measuring

Version 1, 2026-11-14, written before any image of the comparison was rendered or measured. Values marked
"initial" are a committee seat's judgement with no measurement behind them; the comparison is what tests them.

## Viewing conditions

A page is 1600 × 900 pt. Images are rendered at the stated pixel width, never scaled from another width.

| Condition | Image width | What it stands for                                                                      |
| --------- | ----------- | --------------------------------------------------------------------------------------- |
| base      | 1920 px     | the whole page fitted to a 1920 × 1080 screen or projector                              |
| enlarged  | 2400 px     | the delivered image at its own size; a reader who zooms in                              |
| half      | 960 px      | a thumbnail or a page fitted to half a screen; measured and recorded, never a stop line |

A length of 1 px in the plate's drawing space, which is the 2400 px image, is 0.8 px at base and 0.4 px at half.

## Measured quantities

- **Line width.** On a straight run of a line at least 40 px long, at the run's middle: the darkness of each pixel
  across the line is its distance from the paper colour as a share of the line colour's distance from the paper
  colour, from 0 to 1. The effective width is the sum of darkness across the line. The core width is the number of
  pixels across the line whose darkness is at least 0.5. Reported: the median of each over the runs of one kind of
  line on a plate.
- **Pattern pitch.** Along a dashed or dotted run: the lengths in pixels of each stretch with darkness at least 0.5
  and of each stretch below it. Reported: the median dash and the median gap.
- **Character height.** For Han text, the type size in pixels at the condition. For Latin text, the x-height in
  pixels at the condition, measured on a lower-case x or z of the run.

## Distinguishable

Initial values, the information seat's:

- Two widths of line are distinguishable at a condition when their effective widths differ by at least 1.0 px and
  their core widths by at least 1 px.
- A dashed or dotted line is distinguishable from a continuous one when its median dash and its median gap are each
  at least 2 px.
- Two patterns are distinguishable from each other when their median dashes differ by at least a factor of 2, or
  one has a dot (a dash no longer than its line's core width) and the other has none.

## Legible

Initial values, the typography seat's: Han text is legible at a condition when its type size there is at least
12 px; Latin text when its x-height there is at least 6 px.

## Stop line

Two widths of line that are not distinguishable at base: the width channel is not used. At half size everything is
measured and recorded, and the smallest image width at which the text of a whole plate is legible becomes the
minimum delivery width.

## Comparison cells

All on one plate, plate 05 of the Chinese work on Architecture Publisher, which has a hub with four of fifteen
relations:

| Cell             | What differs from 0.14.0                                                               |
| ---------------- | -------------------------------------------------------------------------------------- |
| present          | nothing                                                                                |
| wide hub         | relations into the hub at twice the width, in the oldest dye                           |
| marked hub       | relations into the hub as every other relation; the hub part carries a mark of its own |
| citation numbers | each relation's cited files as a number at its source in place of ticks                |

The figure-reading check runs on every cell at every condition with the same items.
