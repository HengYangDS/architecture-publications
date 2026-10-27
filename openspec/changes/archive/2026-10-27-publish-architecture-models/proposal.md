## Why

Architecture Publisher 0.4.0 reads one input, the Architecture Model, and no
longer reads claim models, edition projects, build requests or the preserved
ETHOS design and artwork. No work in this repository can be built until each
has a model the current publisher reads.

## What Changes

- Each work holds one Architecture Model, `model.json`, pinned to a full commit
  of the repository it describes, with a digest for every cited source file.
- AIGW: the Client Projection claim model becomes an Architecture Model with its
  identities, relations, details, sources, groups and views, pinned to the
  current `aigw-cli` revision after every claim was checked against that tree.
- ETHOS: a new model of the implemented ETHOS architecture, an overview and
  mechanism views, pinned to the current ETHOS revision. The preserved ETHOS
  quality contract (1600 × 900 px, 12 px text, every assertion on one poster)
  no longer binds; the publisher's 1800 × 1350 px, 14 px floor applies.
- **BREAKING**: the AIGW claim model, edition project and build request and
  the ETHOS design and artwork leave the working tree. The originals stay
  retained at their preservation commit and verified through `source.json`;
  the build request, which was never a source original, is removed.
- The input check verifies each model's format, pin, source digests and unique
  id, and the custody of every retained original, without running the
  publisher or a source product.

Out of scope: committing built deliveries, publishing to a website or Forge,
adding works for other repositories, and changing any source repository.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: each work is one pinned Architecture Model, and
  originals of a retired input format are retained in Git rather than kept as
  current files.

## Impact

`publications/aigw-client`, `publications/ethos`, `tools/verification`,
`tests`, the Prettier ignore list and the README. Building a work needs the
Architecture Publisher 0.4.0 command and a checkout of the described
repository; this repository gains no dependency on either.
