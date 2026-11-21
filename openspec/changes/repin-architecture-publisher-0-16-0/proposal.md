## Why

A work follows its repository's latest release. Architecture Publisher released 0.16.0 on 2026-11-21 and its work
pins v0.15.0.

0.16.0 delivers each plate's figure and key alone, as PNG on a transparent ground and as SVG, beside the page
images; ends the edition with an index of the parts, linked from the contents; sets a page's image 3840 px wide by
default; and asks Archify once per build, which validates and writes the page. 29 of the 90 files in the work's
scope changed and none is new; 85 citations stand on lines that moved and 13 on lines that changed.

## What Changes

- The Architecture Publisher work pins v0.16.0 in both languages, with every shifted citation moved and the 13
  touched ones reread and given their ranges at the new tag.
- What the work says agrees with the release where the work speaks of what it changed: the 13 parts and 30
  relations that own a changed file are reread against the diff of their files.
- The work's history takes 0.16.0, and its README, term table and scope name the new pin. `CHANGELOG.md` records
  the move.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pin, and the input check already requires a README
and term table that name the work's pinned revision.

## Impact

`publications/architecture-publisher/`: the models, the guides with their diagram files, the README and the term
table; `CHANGELOG.md`. The described repository is unchanged.
