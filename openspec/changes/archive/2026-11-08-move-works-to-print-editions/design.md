## Context

See [proposal.md](proposal.md). `archpub migrate` writes a version 2 model as
version 3 only when its author declares `editors` beside the free-text
`attribution`; the publisher never parses an attribution into names.
`archpub check --against <commit>` reports each owned file's fate, the claims
and relation files a build there would refuse, the files no claim covers and
each cited line range as the same, shifted, touched or gone.

## Goals / Non-Goals

**Goals:**

- Every work builds with Architecture Publisher 0.10.0, as its edition and its
  page.
- Each re-pinned work describes its repository as released, with every file of
  its scope owned and every guide claim cited at the new release.

**Non-Goals:**

- A view summary for each plate's reading, which a Change of its own drafts
  work by work for the owner's review.
- Pinning Architecture Publisher in this repository's Mise configuration; the
  checks here never run the publisher.

## Decisions

- **Migrate all six works together.** 0.10.0 reads no version 2 model, so a
  work left behind would not build.
- **Apply the worklist, then read what it cannot judge.** A shifted citation
  moves when its new range holds the same text. A touched one is read again at
  the release and its claim rewritten where the release changed it, as are the
  counts, versions and lists that cite no line.
- **New files go to the component their module serves**, as its imports and
  callers show. In ETHOS, `proof_record.py` joins proof and `outcome.py` the
  kernel. In filmkit, the player pages join packaging, their browser reads the
  browser checks, `flow.py` the spoken units and `terms.py` the word checks.
- **The Architecture Publisher work follows the product it describes.** The
  rasterizer and its relations go; the poster composer becomes the plate
  composer; a print edition component owns `src/edition/`, and the house
  tokens join the house class. The poster view becomes the edition's view, and
  the poster lifecycle the edition's workflow.
- **The ETHOS proof timeline is measured again.** beta.6 runs readiness gates,
  then waits for the host's load, then runs tests and packages, so the guide's
  waterfall is rebuilt from one full beta.6 proof and dated.

## Risks / Trade-offs

- [A plate leaves blank the reading it has no summary for] → Each plate
  reports its share of the body and the gates it misses; summaries come in
  their own Change, so this one changes no view's meaning.
- [A described repository releases again while the works move] → Each work is
  checked against its repository's latest release just before it is committed,
  and filmkit, which released twice during the trial, moves to v0.16.0 here.
