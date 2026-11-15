# Reading of rebuilt plates: the list

Written 2026-11-15 before the reviewer was shown a plate. You hold the reviewer's role for how four plates of
architecture editions are drawn. You did not draw them. A plate is one page: a figure of named parts joined by
lines, a key line at the foot of the figure, and text around it. You give a verdict on each item below for each
plate. This is a reading against a list, not an acceptance of the edition.

## What you have

`plates/` holds four plates. For each there are five images and one sheet:

- `<name>.png`: the whole plate, 2400 × 1350 px.
- `<name>-a.png`, `-b`, `-c`, `-d`: the same plate at native resolution in four overlapping tiles of 1260 × 715 px:
  `a` top left, `b` top right, `c` bottom left, `d` bottom right. Small things show only in the tiles: read all
  four for every plate.
- `<name>.facts.md`: what the build knows of the plate, taken from the model it was built from and from the
  build's own report: the hub, if the view has one; every relation with the parts it joins and the number of files
  it cites; and the relations for which the build itself reported that the number found no clear place.

Read nothing outside this directory.

## What the plates are meant to show

- **Lines into the hub are heavy.** A view's hub is the part most relations lead into. Every line that leads into
  the hub is drawn about twice as heavy as the other lines, in a dark colour, and ends inside an arrowhead larger
  than the other lines' heads. No other line is heavy.
- **Cited files are a number.** Near the source end of each relation's line stands a small number: how many files
  the relation cites. There are no tick marks across lines.
- **The key holds what the figure draws.** The key line holds a heavy arrow with words naming the hub exactly when
  the figure has heavy lines; a small number with words exactly when lines carry numbers; a dashed sample exactly
  when the figure has a dashed frame around the parts inside the repository.

## Items, for every plate

1. **Heavy lines.** Against the sheet: is every relation into the hub drawn heavy along its whole length, with the
   larger head? Is any other line heavy? Does any heavy line show a stub or a blob beside its arrowhead? A plate
   whose sheet names no hub has no heavy line.
2. **One weight along a line.** Does any straight piece of a line look thinner than the rest of the same line, or
   is a piece missing, anywhere, and in particular near the middle of the figure?
3. **Numbers present and right.** For every relation of the sheet: is its number there, near its source end, and
   does it equal the sheet's? Name each that is missing, wrong or cannot be read.
4. **Numbers clear.** Does any number touch or overlap a line, an arrowhead, a label, a part's text or the dashed
   frame? For each relation the sheet lists as reported by the build: say what its number touches and whether the
   number can still be read and told to belong to its line. Name any other number that touches something and that
   the build did not report.
5. **Key.** Does the key hold exactly the three kinds of entry above that the figure draws, and no entry for
   something the figure does not draw? Is there any tick mark or any word about ticks?
6. **Frame.** If the figure has a dashed frame, is it whole on its four sides (its name may interrupt the top)?
7. **Anything else** that is drawn wrong: marks on top of each other, text cut off, a line through text.

## What to return

Write `verdicts.json` in this directory, and nothing else anywhere:

```json
{
  "holder": "<your name>",
  "plates": {
    "<name>": {
      "1": {
        "verdict": "ok | finding | cannot tell",
        "what": "<for a finding: tile letter, the relation or part, what you see>"
      }
    }
  }
}
```

Every plate has all seven items. A `finding` names the tile and the relation or part. Then reply with the count of
findings per item.
