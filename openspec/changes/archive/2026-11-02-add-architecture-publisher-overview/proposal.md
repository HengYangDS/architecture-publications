## Why

Architecture Publisher now typesets a work's overview from a Typst composition
that the work's author writes with its house class. The works here cannot hold
one: the input check admits only the model, its README and a custody record.

The architecture-publisher work is also pinned at `3bf75fd`, before the
publisher moved its package to the repository root. Of its 27 cited sources,
25 have moved and two are deleted, and it cites 27 of the 55 files under `src/`.

## What Changes

- A work may hold the overview composition its model names: one `.typ` file
  beside the model. The input check admits that file and fails a model that
  names a composition the work lacks or a path outside the work.
- The architecture-publisher work is re-pinned at `97c2079`. It cites every
  file under `src/` with its digest and declares `src/` as its coverage scope.
  It adds the coverage report, the overview typesetter and the publisher's
  words, and two views, the checks and the LikeC4 import, beside its three.
  It names its overview composition.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: a work may hold the overview composition its model
  names.

## Impact

The input check and its tests, the architecture-publisher work's model, README
and new composition, and the repository README. The ETHOS and AIGW works keep
their models until they are re-pinned with compositions of their own.
