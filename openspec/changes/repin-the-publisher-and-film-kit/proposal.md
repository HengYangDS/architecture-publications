## Why

Each work follows its repository's latest release. Architecture Publisher has released 0.12.0 and Film Kit
0.20.0, and their works still pin v0.11.0 and v0.19.0.

## What Changes

- Architecture Publisher's work pins v0.12.0 and Film Kit's v0.20.0, in both languages, with every citation
  moved or reread by the re-pin worklist, every file the release adds claimed and each history ending at its
  pinned release.
- Each work's README, term table and scope name the new pin, and `CHANGELOG.md` records the moves.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pins, and the input check already requires a
README and term table that name each work's pinned revision.

## Impact

`publications/architecture-publisher/` and `publications/filmkit/`: the models, overviews, guides, READMEs and term
tables; `CHANGELOG.md`. The described repositories are unchanged.
