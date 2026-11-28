## Why

A work follows its repository's latest release. On 2026-11-28 three works pin releases their repositories have moved
past: AIGW Client v0.10.0 (latest v0.12.0), OpenAI Responses Proxy v7.0.2 (v8.0.0) and ETHOS v0.2.0-beta.11
(v0.2.0-beta.12). Architecture Publisher, DDWG and Film Kit pin their latest.

## What Changes

- Each of the three works pins its repository's latest release in both languages, with every shifted citation moved
  and every touched or gone one reread and given its range at the new tag, or removed with the claim the release
  removed.
- What each work says agrees with its release where the work speaks of what the release changed: the parts and
  relations that own a changed file are reread against the diff of their files, a file new in scope gets an owner,
  and a claim whose file the release deleted is settled. The AIGW Client work no longer describes Windows, which
  v0.11.0 removed; the ETHOS work says ETHOS deprecates Windows, as its release does.
- Each work's history takes the releases its rule admits, and its README, term table and scope name the new pin.
  `CHANGELOG.md` records the moves.
- The repository's README says how to run Architecture Publisher 0.19.0 by name where a later release is installed.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pin, and the input check already requires a README
and term table that name the work's pinned revision.

## Impact

`publications/aigw-client/`, `publications/openai-responses-proxy/` and `publications/ethos/`: the models, the guides
with their diagram files, the READMEs and the term tables; `README.md` and `CHANGELOG.md`. The described repositories
are unchanged.
