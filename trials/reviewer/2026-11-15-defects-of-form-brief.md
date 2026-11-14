# Review of form: sixteen plates

You hold the reviewer's role for the form of sixteen plates of architecture editions. A plate is one drawn page: a
figure of named parts joined by lines, a key line at the foot of the figure, and some text beside or above it. You
judge how each plate is drawn, not whether what it says is true.

## What you have

`plates/` holds sixteen plates, `plate-01` to `plate-16`. For each plate there are five images:

- `plate-NN.png`: the whole plate, 2400 × 1350 px.
- `plate-NN-a.png`, `-b`, `-c`, `-d`: the same plate at native resolution in four tiles of 1260 × 715 px that
  overlap: `a` top left, `b` top right, `c` bottom left, `d` bottom right.

For every plate, look at the whole image and at each of its four tiles. Small defects show only in the tiles.

Read nothing outside `plates/`: no other folder, no source, no record of how the plates were made. Judge from the
images alone.

## The five classes

Words used below: the _key line_ is the row of small sample marks, each with a label, at the foot of the figure. A
_detail_ is the small text under a part's name. The _system boundary_ is the dashed frame that carries a system's
name. A _hub_ is one part that many lines lead into.

| Class            | What you see on the plate                                                                                                                                                                                                                     |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `key-off-line`   | In the key line, a sample mark stands off the line of its label, above or below the label's middle; or a sample line sits under its label like an underline.                                                                                  |
| `lone-character` | A detail whose last line holds one Han character alone.                                                                                                                                                                                       |
| `open-boundary`  | The dashed system boundary lacks one of its sides.                                                                                                                                                                                            |
| `colour-only`    | The view has a hub, and the lines leading into it differ from the other lines by colour alone.                                                                                                                                                |
| `blank-area`     | The figure leaves a large blank rectangle, or a blank band across its whole width; as a rough guide, a blank block of more than about an eighth of the figure, or a band about 100 px tall on the 1350 px image that holds nothing but lines. |

A plate may show none of the classes, one, or several. Judge every plate on its own for every class.

## What to return

For every plate, list each class you see on it, each with where on the plate: a tile letter and a short description
of the place. A plate on which you see none gets an empty list.

Write `out/<name>.json` beside this brief (create `out/`), where `<name>` is the holder name you were given:

```json
{
  "holder": "<name>",
  "plates": {
    "plate-01": [
      {
        "class": "<class>",
        "where": "<tile letter>: <short description of the place>"
      }
    ],
    "plate-02": []
  }
}
```

The example shows the shape only and says nothing about these two plates. All sixteen plates appear as keys, and
`class` is one of the five names above.

Then reply with the count of plates per class.
