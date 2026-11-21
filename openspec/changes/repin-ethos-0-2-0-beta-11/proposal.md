## Why

A work follows its repository's latest release. ETHOS released 0.2.0-beta.11 on 2026-11-21 and its work pins
v0.2.0-beta.10.

beta.11 pins itself in a repository's Mise configuration when a release build adopts the repository, accepts a release
by `ethos release accept`, reads the host's queue by `ethos host status`, reads a head's hosted runs by
`ethos publish --observe-hosted` without granting authority, and lets an obligation that only reports refuse no path.
104 of the 521 files in the work's scope changed and five are new; 44 citations stand on lines that moved and 2 on
lines that changed.

## What Changes

- The ETHOS work pins v0.2.0-beta.11 in both languages, with every shifted citation moved and the 2 touched ones
  reread and given their ranges at the new tag.
- What the work says agrees with the release where the work speaks of what it changed: the 32 parts and 56
  relations that own a changed file are reread against the diff of their files, and each of the five new files is
  owned by the part whose subject it implements.
- The work's history takes beta.11, and its README, term table and scope name the new pin. `CHANGELOG.md` records
  the move.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pin, and the input check already requires a README
and term table that name the work's pinned revision.

## Impact

`publications/ethos/`: the models, the guides with their diagram files, the README and the term table;
`CHANGELOG.md`. The described repository is unchanged.
