## Why

A work follows its repository's latest release. Film Kit released 0.24.0 on 2026-11-19 and its work pins v0.23.1.

0.24.0 changes what Film Kit does at places the work describes. The engine draws a film's pictures on a native
canvas with its own Node module, a breaking change: HyperFrames, GSAP and the browser leave the render, and the
browser stays for the geometry check, the whole-turn gate, the cover and the player check. A film's `@font-face`
rules have one reader. A take has one judgment, which the audition and the two new commands `judge` and `converge`
share, and a take is held to its words by reading. A duration record states the host's load. 31 of the 138 files
in the work's scope changed and ten files in scope are new; 54 citations stand on lines that moved and 32 on lines
that changed.

## What Changes

- The Film Kit work pins v0.24.0 in both languages, with every shifted citation moved and every touched one
  reread.
- Each new file in scope is owned by the part whose subject it implements; a part is added only where no part of
  the work has that subject.
- What the work says agrees with the release where the work speaks of what the release changed: the 18 parts and
  38 relations that own a changed file are reread against the diff of their files.
- The work's history takes 0.24.0, and its README, term table and scope name the new pin. `CHANGELOG.md` records
  the move.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pin, and the input check already requires a README
and term table that name the work's pinned revision.

## Impact

`publications/filmkit/`: the models, the guides with their diagram files, the README and the term table;
`CHANGELOG.md`. The described repository is unchanged.
