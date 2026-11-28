## Why

A work follows its repository's latest release. On 2026-11-28 two works pin releases their repositories have moved
past: Architecture Publisher v0.21.0 (latest v0.22.0, tagged 21:29) and DDWG v10.1.3 (latest v10.2.0, tagged
22:39, after v10.1.4 at 19:41). AIGW Client, OpenAI Responses Proxy, ETHOS and Film Kit pin their latest.

## What Changes

- Each of the two works pins its repository's latest release in both languages, with every shifted citation moved
  and every touched one reread and given its range at the new tag.
- What each work says agrees with its release where the work speaks of what the release changed: the parts and
  relations that own a changed file are reread against the diff of their files, and a file new in scope gets an
  owner. The Architecture Publisher work says how a view's plate is composed (tiers, a matrix, a radial figure or a
  spine) and how tiers fill the blank their rows leave; the DDWG work says what hiring may weigh, how a tier is told
  to a member, and why the four boundaries hold.
- Each work's history takes the releases its rule admits, and its README, term table and scope name the new pin.
  `CHANGELOG.md` records the moves.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pin, and the input check already requires a README
and term table that name the work's pinned revision.

## Impact

`publications/architecture-publisher/` and `publications/ddwg/`: the models, the guides with their diagram files,
the READMEs and the term tables; `CHANGELOG.md`. The described repositories are unchanged.
