# Proposal

## Why

Architecture Publisher names each view's diagram, its full viewer and its entry
in the page's list of panels by the view's own title, and a later poster of
one view leads with that title. A view without a title of its own is named by
its question on the page and by the model's title on its poster. A blind review
of the AIGW and ETHOS deliveries found their first panel named after the model
in four places, and two AIGW posters that lead with the same model title.

## What Changes

- AIGW: the overview, authority and adapters views are titled Overview,
  Authority and Adapters.
- ETHOS: the overview view is titled Overview.
- The publication inputs specification requires every view to have a title of
  its own.

Out of scope: any component, relation, detail, source, pin or view question,
the ETHOS mechanism views, which have titles, and any source repository.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: every view has a short title of its own.

## Impact

`publications/aigw-client/model.json` and `publications/ethos/model.json`
change; the input check gains the title requirement.
