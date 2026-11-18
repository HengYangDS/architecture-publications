## Why

Architecture Publisher 0.15.0 draws a work's overview from a statement in its model and refuses a model that names
a composition (`model_overview_composition_retired`). Each of the six works names `overview.typ` in both languages,
a page its author placed by coordinates in the publisher's house class, so none of the twelve models checks or
builds with the release. The publisher's own work pins v0.14.0 and describes the composition as a part of the
product.

## What Changes

- Each of the twelve models states its overview: the claim, the lead, the course with its steps, stations,
  branches, lines and spurs, and the blocks, in the wording of the composition it replaces. The twelve
  `overview.typ` files leave. **BREAKING**: checking or building a work needs Architecture Publisher 0.15.0 or
  later.
- The input check fails a model whose `overview` names a file, fails a Typst file beside a model, and requires the
  languages of one work to state one overview: the same blocks, steps, stations and items at the same places, with
  the same identifiers and references.
- The Architecture Publisher work pins v0.15.0 in both languages. What it says of the overview, of what a delivery
  holds and of the commands agrees with the release; each file new in its scope is owned by a part; its history
  takes the release; its README, term table and scope name the new pin.
- Film Kit's statement names the detail audit among what stands before a picture is rendered. The composition
  lacked the item since the work moved to v0.23.1.
- Each work's README, the repository's README and `CONTRIBUTING.md` say that the model states the overview and the
  publisher draws it, and name 0.15.0 as the lowest version of the publisher. `CHANGELOG.md` records the change.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: a work states its overview in its model; a composition beside a model is refused; the
  languages of a work state one overview.

## Impact

Every work under `publications/`: the models, the compositions that leave, the READMEs; the Architecture Publisher
work whole (model, guide, term table, README); `tools/verification/publication-inputs.mjs` and its tests;
`README.md`, `CONTRIBUTING.md`, `CHANGELOG.md`. The described repositories are unchanged. A delivery built before
this change is not in the repository and is not affected.
