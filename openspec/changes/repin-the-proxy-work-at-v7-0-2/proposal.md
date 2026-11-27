## Why

A work follows its repository's latest release. The OpenAI Responses Proxy released v7.0.2 at 14:30 on 2026-11-27,
after the publications' dev had taken its work at v7.0.1 (landed 14:05). v7.0.2 withdraws 7.0.1: the DMXAPI route again builds
every attempt from the projected request, since a measurement that day showed no benefit. So the work describes a
behaviour its repository no longer has.

## What Changes

- The OpenAI Responses Proxy work pins v7.0.2 in both languages: the citations the release shifted are moved, the
  seven it touched are reread, and what the work said of a DMXAPI first attempt sent as written is withdrawn, each
  sentence again stating what v7.0.2 implements.
- Its history keeps 7.0.1 and takes 7.0.2, its withdrawal; its README, term table and scope name the new pin.
- The `portability` view and its block take back the title they had before 7.0.1, "What leaves the listener"
  (「发往提供商的请求」): it covers the smaller requests recovery sends as well as the projection.
- `CHANGELOG.md`'s record of the re-pins names v7.0.2 and says what the work describes at it.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pin.

## Impact

`publications/openai-responses-proxy/`: the models, the guides with their diagram files, the README and the term
table; `CHANGELOG.md`. The described repository is unchanged.
