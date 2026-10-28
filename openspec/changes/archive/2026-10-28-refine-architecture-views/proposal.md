# Proposal

## Why

Architecture Publisher now refuses a poster it cannot balance and never draws
one component twice on a page. The AIGW model's transaction view has three
components, two of them also in the adapters view, so it can neither fill a
page of its own nor share one. The AIGW limits also say that source digests
prove which bytes were read: that is evidence the publisher's manifest keeps,
not something the architecture poster describes.

## What Changes

- AIGW: the transaction view joins the adapters view, which then asks how
  native client adapters are admitted and dispatched and where their effects
  are guarded. The model keeps its components, relations, sources and pin and
  has three views instead of four.
- AIGW: the limits say what the model leaves out without claiming that any
  source was verified.
- The publication inputs specification states that model prose describes the
  architecture and claims no verification.

Out of scope: the ETHOS model's views, any source repository, and the pinned
revisions and source digests.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: a model's prose describes the architecture and claims
  no verification of its sources.

## Impact

`publications/aigw-client/model.json` and `publications/aigw-client/README.md`
change. The input check and its tests are unchanged.
