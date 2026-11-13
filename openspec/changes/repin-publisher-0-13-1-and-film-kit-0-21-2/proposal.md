## Why

A work is re-pinned when its repository's architecture has moved. Architecture Publisher has released 0.13.0 and
0.13.1 and Film Kit 0.21.0 to 0.21.2, and their works still pin v0.12.0 and v0.20.0. Both moved what the works
describe. The publisher now draws each part as a strip as long as its code, in a palette the edition names, and seals
an accepted delivery on a colophon page; its work says none of it and leaves `src/style.mjs` unclaimed. Film Kit's
verification reads each film's keywords and authors back from Spotlight and its picture gate refuses more still
states; its work lists neither, and two new files have no owner.

## What Changes

- Architecture Publisher's work pins v0.13.1 and Film Kit's v0.21.2, in both languages, with every citation moved or
  reread by the re-pin worklist, every file the releases add claimed and each history ending at its pinned release.
- Each work's README, term table and scope name the new pin, and `CHANGELOG.md` records the moves.
- The Chinese Architecture Publisher work says 提交 where it said 修订 for a revision, as the edition's foot does.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pins, and the input check already requires a
README and term table that name each work's pinned revision.

## Impact

`publications/architecture-publisher/` and `publications/filmkit/`: the models, overviews, guides, READMEs and term
tables; `CHANGELOG.md`. The described repositories are unchanged. The works on AIGW and the Responses proxy keep
their pins until those repositories' histories are rebuilt, since a rebuild replaces the commits a work binds.
