## Context

Architecture Publisher typesets a work's overview from a Typst composition the
model names in `overview`, a file beside the model. This repository's input
check admits a fixed set of work files, and the architecture-publisher work is
pinned before the publisher moved its package to the repository root.

## Goals / Non-Goals

**Goals:**

- A work may hold the one composition its model names, and the input check
  still refuses any other file.
- The architecture-publisher work describes the publisher as built at
  `97c2079`, cites every file of its source and has its overview.

**Non-Goals:**

- Re-pinning the ETHOS and AIGW works or composing their overviews; each
  follows in its own Change.
- Running the publisher in this repository's checks; `archpub check --repo`
  stays the full validation.

## Decisions

- **The model names the composition.** The input check reads the composition's
  name from the model rather than admitting any `.typ` file, so a stray file is
  still refused and a named one cannot be missing.
- **One file beside the model.** The publisher stages the composition's own
  directory, so a work holds the composition and nothing more; a path with a
  directory is refused here, before the publisher would stage it.
- **The work's scope is `src/`.** The publisher's product is its source tree;
  tests, tools and documents are the repository's, not the architecture the
  work draws. Citing every file of `src/` makes the coverage report a check
  that new modules are placed.

## Risks / Trade-offs

- The work pins a commit that is published only when archpub's overview Change
  is. This lane lands after that publication.
