## Why

A work follows its repository's latest release. AIGW released 0.8.3 on 2026-11-19 and its work pins v0.8.2.

0.8.3 changes what `aigw setup --from` does, a breaking change the work describes at its team file. The command now
applies the team file whatever becomes of each Token: in a terminal it first asks which of the file's providers
without a stored Token the operator holds one for, asks only for those, lets a Token its provider does not accept
be entered again or its provider skipped, and sets up every other provider and client. Its JSON document moves to
schema version 4 with a Token's state and reason. The team file names a fourth provider and recommends, for each
client, a model on each. 10 of the 242 files in the work's scope changed and one is new; 55 citations stand on
lines that moved and 5 on lines that changed.

## What Changes

- The AIGW Client work pins v0.8.3 in both languages, with every shifted citation moved and the five touched ones
  reread and given their ranges at the new tag.
- What the work says agrees with the release where the work speaks of what the release changed: the five parts and
  seven relations that own a changed file are reread against the diff of their files, and the guide's section on
  the team file says what the command does with Tokens.
- The work's history takes 0.8.3, and its README, term table and scope name the new pin. `CHANGELOG.md` records the
  move.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pin, and the input check already requires a README
and term table that name the work's pinned revision.

## Impact

`publications/aigw-client/`: the models, the guides with their diagram files, the README and the term table;
`CHANGELOG.md`. The described repository is unchanged.
