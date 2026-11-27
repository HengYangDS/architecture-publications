## Why

A work follows its repository's latest release. On 2026-11-27 five works pin releases their repositories have moved
past: OpenAI Responses Proxy v6.0.3 (latest v7.0.0), AIGW Client v0.8.3 (v0.10.0), Architecture Publisher v0.16.0
(v0.21.0), DDWG v8.0.0 (v10.1.3) and Film Kit v0.26.0 (v0.35.0). ETHOS pins its latest, v0.2.0-beta.11.

## What Changes

- Each of the five works pins its repository's latest release in both languages, with every shifted citation moved
  and every touched or gone one reread and given its range at the new tag, or removed with the claim the release
  removed.
- What each work says agrees with its release where the work speaks of what the release changed: the parts and
  relations that own a changed file are reread against the diff of their files, a file new in scope gets an owner,
  and a claim whose file the release deleted is settled.
- Each work's history takes the releases its rule admits, and its README, term table and scope name the new pin.
  `CHANGELOG.md` records the moves.
- The repository's README names the publisher releases that check and build the works, 0.17.0 to 0.19.0, since 0.20.0
  and later refuse the positions and sizes the works' guides state; each of the six works' READMEs points to it in
  place of its own range, which said 0.15.0 or later.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pin, and the input check already requires a README
and term table that name the work's pinned revision.

## Impact

`publications/openai-responses-proxy/`, `publications/aigw-client/`, `publications/architecture-publisher/`,
`publications/ddwg/` and `publications/filmkit/`: the models, the guides with their diagram files, the READMEs and
the term tables; ETHOS's README; `README.md` and `CHANGELOG.md`. The described repositories are unchanged.
