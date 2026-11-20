## Why

A work follows its repository's latest release. Film Kit released 0.25.0 and 0.26.0 on 2026-11-20 and its work
pins v0.24.1.

0.25.0 prepares a review round by one command and removes the commands it replaces, writes a film's release record
from the delivered build, and lists in one run what a release asks of a film. 0.26.0 scans each edition's packaged
film for still pictures under speech and makes the verification and the delivery require that scan, and has
`narration.converge` say whether a settled edition fits its runtime. 26 of the 148 files in the work's scope changed
and seven are new; 60 citations stand on lines that moved and 22 on lines that changed.

## What Changes

- The Film Kit work pins v0.26.0 in both languages, with every shifted citation moved and the 22 touched ones
  reread and given their ranges at the new tag.
- What the work says agrees with the releases where the work speaks of what they changed: the fourteen parts and
  31 relations that own a changed file are reread against the diff of their files, and each of the seven new
  files is owned by the part whose subject it implements.
- The work's history takes 0.25.0 and 0.26.0, and its README, term table and scope name the new pin.
  `CHANGELOG.md` records the move.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pin, and the input check already requires a README
and term table that name the work's pinned revision.

## Impact

`publications/filmkit/`: the models, the guides with their diagram files, the README and the term table;
`CHANGELOG.md`. The described repository is unchanged.
