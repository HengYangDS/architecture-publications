## Why

Architecture Publisher 0.10.0, released on 8 November, replaced the poster
pages with a print edition and reads only model version 3, which names a
work's editors and licence. Every work here is a version 2 model, so no work
builds with the current release. Two works also trail their repositories'
latest releases: the ETHOS work is at v0.2.0-alpha.28 and the filmkit work at
v0.10.0. The Architecture Publisher work describes v0.9.0's posters.

## What Changes

- Each of the six works moves to model version 3 with `archpub migrate`: its
  editor, Yang HENG, is declared beside its attribution, which the migration
  then drops. Each model also gains the MIT licence and a browse template for
  its repository's files at the pinned revision.
- Three works move to their repositories' latest releases, from the re-pin
  worklist `archpub check --against` reports:
  - ETHOS at v0.2.0-beta.6 (`727ee05`)
  - filmkit at v0.16.0 (`d6de895`)
  - Architecture Publisher at v0.10.0 (`548637c`): its poster view and
    lifecycle give way to the print edition's view and workflow.
- The input check reads version 3, and the README and the input
  specification describe the edition's plates rather than posters.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: a view's title and a model's scope are read on the
  edition's plates and title page, not on posters.

## Impact

`publications/`, `tools/verification/publication-inputs.mjs`, its test,
`README.md` and `openspec/specs/publication-inputs/spec.md`. The AIGW, DDWG and
OpenAI Responses Proxy works keep their pins.
