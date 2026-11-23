## Context

See [proposal.md](proposal.md). The publisher's drawing of the overview in three sizes keeps the notes at the size
read on a screen and narrows only the spacing; a page that still runs past its foot is refused (`overview_too_tall`).
The shortened words have one source in the publisher's work directory (`edition-map/shorten/shorten.py`). Its record
lists each cut and the place on the same page that still states the fact. Two readers other than the writer read the
words against the originals, in both languages.

## Goals / Non-Goals

**Goals:**

- Each of the four overviews fits one page in the drawing of three sizes, and still says everything it said.

**Non-Goals:**

- The publisher's layout itself, which its own Change brings with its drawings.
- The other four works, whose overviews fit as they stand.

## Decisions

- **A fact is stated once on a page.** A line goes only where the same page states its fact elsewhere, and the record
  names that place. Where a cut would lose a fact, the words stay: "without credentials" in the team list's title,
  the data plane's "plan · apply · check" and the publisher's one output directory.
- **Two short lists become one.** AIGW Client's team lines pair `setup --from team.toml` and `--dry-run` in one line,
  the way its block of states pairs `local · endpoint`; each keeps its own words.
- **Edited only where the value changes.** Each model is rewritten at the spans whose value changes and must parse to
  the intended model, every other value unchanged.

## Risks / Trade-offs

- The fit is measured in a drawing, not in a release. When the publisher's layout lands, its own check measures every
  work again, and a work that runs over is refused by name.
- English drops the Tokens spur's "or" to stay on one line, so "Who owns what" carries "one store" in both languages.
