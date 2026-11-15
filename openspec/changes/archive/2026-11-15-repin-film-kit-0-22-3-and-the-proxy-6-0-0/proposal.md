## Why

A work follows its repository's latest release. On 2026-11-15 Film Kit released 0.22.3 and the OpenAI Responses
Proxy released 6.0.0, and their works pin v0.22.2 and v5.1.12. The proxy's release is breaking: it removes the
drain control (two control routes, a local response, two status counters, two failure classes and two health
fields), and upgrade, rollback and reload now replace a running listener only by handoff. The work describes the
drain in its model, its history and its guide, so those statements are no longer true of the latest release. Film
Kit's release adds one option to a script's voice performance, which levels each segment within its chapter.

## What Changes

- The proxy's work pins v6.0.0 and Film Kit's v0.22.3, in both languages, with every shifted citation moved and
  every touched one reread by the re-pin worklist.
- The proxy's work no longer describes the drain as something the proxy does: what it said of the drain is removed
  or restated as history, and what it says of upgrade, rollback, reload and a failed handoff is what 6.0.0 does.
- Each work says what its release adds that a reader of the work would look for, and its history ends at the last
  release up to the pin that changed what the system does for its users.
- Each work's README, term table and scope name the new pin, and `CHANGELOG.md` records the moves.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pins, and the input check already requires a
README and term table that name each work's pinned revision.

## Impact

`publications/openai-responses-proxy/` and `publications/filmkit/`: the models, overviews, guides, READMEs and
term tables; `CHANGELOG.md`. The described repositories are unchanged.
