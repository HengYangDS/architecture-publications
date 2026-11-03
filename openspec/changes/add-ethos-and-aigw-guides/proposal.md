## Why

Architecture Publisher now delivers a guide its author writes as a work's page:
an Archify explainer draft beside the model, whose cited lines Archify checks
against the repository at the model's revision. The ETHOS and AIGW works' pages
are still the ones the publisher generates from their views, which repeat their
posters. No work can hold a guide yet: the input check admits only files at a
work's top level.

## What Changes

- A work may hold the guide its model names, `<directory>/<name>.archify.md`,
  in a directory of its own that holds only regular files.
- The ETHOS work names its guide. It opens with what ETHOS is for, who
  reaches it and what adoption writes, then follows one change from a lane to
  every peer and a lane's life with its recoveries. It shows what decides
  whether an effect runs, what one transition binds, the parts that carry a
  change and one measured full proof. It ends with the evidence planes, why
  local proof is enough and when it is not, what every repository shares, the
  principles behind the design and what is still open. Every claim cites a line
  range at v0.2.0-alpha.28.
- The AIGW work names its guide. It opens with who uses AIGW and how a team
  gets started, then shows what its configuration holds, one sync as a guarded
  transaction, a newer edit that survives a rollback and where a client's Token
  comes from. It ends with how much each check proves, how a provider's model
  becomes a Route, its parts, why one guarded transaction, what AIGW leaves to
  others, how it is released and rolled back, and what is still open. Every
  claim cites a line range at v0.6.0.
- Both overviews' imprints said every view, step by step, is in the
  interactive page. They now say each view has its poster and the page is the
  guide.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: a work may hold the guide its model names, in a
  directory of its own.

## Impact

The input check and its tests; the ETHOS and AIGW works' models, overviews,
READMEs and new `guide/` directories; and the repository README. The
Architecture Publisher work keeps the generated page until it has a guide of
its own.
