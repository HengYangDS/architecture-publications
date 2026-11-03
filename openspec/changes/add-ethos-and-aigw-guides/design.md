## Context

The input check keeps each work to its model, its README, an optional
`source.json` and the overview composition its model names, and runs neither
the publisher nor a described product. Architecture Publisher reads a guide's
local files, the diagrams and data its draft names, from the draft's own
directory, stages only those and validates the draft with Archify at the
build's quality, with strict writing checks at showcase.

## Goals / Non-Goals

**Goals:**

- A work can hold its guide, and the ETHOS and AIGW works' pages become their
  guides.

**Non-Goals:**

- A guide for the Architecture Publisher work; it follows in its own Change.
- Reading drafts in the input check. Which files a draft names and whether its
  citations hold remain the publisher's check.

## Decisions

- **A guide lives in a directory of its own.** The model names
  `<directory>/<name>.archify.md` and the draft's diagrams sit beside it there,
  so a work's top level keeps only the files the check names. The check admits
  that one directory, with regular files only and the draft among them. A draft
  beside the model was rejected: its diagrams would then crowd the top level.
- **The repository's formatter formats the drafts and their diagrams.** A draft
  is Markdown and a diagram is JSON, so Prettier formats them like any other
  file of their kind here. The publisher's strict check of the formatted draft
  confirms Archify reads it unchanged in meaning.
- **Each guide is written for its reader.** It leads with what the product is
  for and how a reader uses it, then how it works, then where it stops and what
  is still open. Each diagram is the native form of its question: a context map,
  a lifecycle, a workflow, sequences, a class or entity diagram, a parts map
  and, for ETHOS, a measured waterfall.
- **A word on the page lights the part it names.** Archify links a word to the
  diagram node whose label it matches. Labels name exact parts, so a common
  word does not light an unrelated node.

## Risks / Trade-offs

- [A guide's directory holds a file its draft does not name] → The publisher
  stages only what the draft names, so the file never reaches a page.
- [A later release changes a cited line] → Each guide is pinned with its model;
  a re-pin re-checks every cited range through `archpub check --repo`.
- [The ETHOS waterfall is a measurement, not a cited line] → Its caption names
  the run it measured: one full proof of Architecture Publisher under ETHOS
  v0.2.0-alpha.28. A re-pin measures again or removes it.
