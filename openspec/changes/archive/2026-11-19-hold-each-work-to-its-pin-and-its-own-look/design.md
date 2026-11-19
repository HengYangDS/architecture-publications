## Context

See [proposal.md](proposal.md). A work's page may show a measurement beside what it cites: the ETHOS work shows
where one full proof spends its time, and the publisher's own work shows how much a move of its pin listed. Such
a number is a fact about one run, with a date and a version, and it ages when the work moves its pin and the run
is not made again.

## Goals / Non-Goals

**Goals:**

- A measurement a work shows was made at the work's pin, and says when and on what.
- Each work is drawn in a palette its model names.
- The Chinese editions carry their editor's Chinese name.

**Non-Goals:**

- A gate that refuses an old measurement: the product does not know which numbers of a guide are measurements. The
  holder's ledger of the owner's asks carries the rule, and a re-pin's worklist is where it is applied.
- New palettes: the choice here is among what the product offers and its reference's own two examples.
- The positions written in the guides' diagram files: they leave with the product's Change that lays those
  diagrams out.

## Decisions

1. The proof measured is the publisher's own, as before, at the newest proof ETHOS v0.2.0-beta.10 ran on it.
   - Rests on: the proof's event log of 2026-11-19 07:29 to 08:03 for `architecture-publisher` at `37b2376`: each
     gate's start after the first gate and its duration, and the wait for the host's load.
   - Considered: a proof of ETHOS itself. Not chosen: the figure has shown the publisher's proof since it was
     drawn, its three phases are the same, and the step texts cite the same lines.
   - What the numbers say: the readiness gates end after 134 s, the proof waits 15 s for the host, and the test
     and package gates end at 1052 s, of which one behaviour gate takes 901 s.
2. The publisher's own work shows the worklist of its last move, v0.14.0 to v0.15.0.
   - Rests on: `archpub check --against 7018b02` of 2026-11-18 on the work as it stood at `4be4dd7`: 96 commits
     since the pin, 31 of 73 owned files modified, 1 deleted, 15 components with modified files, 36 relations
     whose cited files changed, none refused, 11 newly uncovered files.
   - The sentence under the table says where the eleven went, as the work's model now holds them.
3. A palette a work, by what the work is about; the two languages of a work share it.
   - ETHOS keeps Indigo, the default, and names it: the reference work of the set.
   - Data Department Work Guidelines takes Soot: a document repository, drawn in ink.
   - Architecture Publisher takes Persimmon, AIGW Client Patina, Film Kit Sappan and the Responses proxy Chestnut;
     the last two are the palettes the model reference gives as examples of an author's own, written into the
     models as their six colours.
   - Considered: the twelve palettes of the research of 2026-11-13. Not chosen here: ten of them are in no
     document of the product, and adding them to the product is the queue item `palettes-and-styles`.
   - `archpub check` holds each palette to the print rules.
4. The Chinese models' editor is 衡阳; the English models keep Yang HENG.
   - Rests on: the owner's word of 2026-11-12. The edition prints the model's editors on its title page.

## Risks / Trade-offs

- [A palette changes every plate's colours] → the twelve deliveries are built again and looked at before they are
  shown; a palette that reads worse is changed in a later Change.
- [The figure's numbers are one run] → its subtitle says which, and when.
