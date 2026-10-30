# Proposal

## Why

A blind review of the AIGW and ETHOS deliveries found the first panel of both
pages titled "Overview" in its panel title, its entry in the page's list of
panels, its caption and its full viewer, which says nothing about what the view
shows. The other three works the publisher is reviewed on name their overview
by its subject.

## What Changes

- AIGW: the overview view is titled "From intent to guarded projections".
- ETHOS: the overview view is titled "One change, from lane to landing".
- The publication inputs specification requires a view's title to name what the
  view shows.

Out of scope: any component, relation, detail, source, pin or view question,
the other views, which name their subject, and any source repository.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: a view's title names what the view shows.

## Impact

`publications/aigw-client/model.json` and `publications/ethos/model.json`
change; no check changes.
