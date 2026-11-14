## Why

A work follows its repository's latest release. AIGW has released 0.7.1 and the OpenAI Responses Proxy 5.1.11 and
5.1.12, and their works still pin v0.7.0 and v5.1.10. The two works were held back for rebuilds of their
repositories' histories, which replace the commits a work binds. Those rebuilds are now planned for January 2027 and
are tied to no release of either product, so holding the works would leave them behind for two months.

## What Changes

- AIGW's work pins v0.7.1 and the Responses proxy's v5.1.12, in both languages, with every shifted citation moved
  and every touched one reread by the re-pin worklist.
- Each work says what its releases add that a reader of the work would look for, and its history ends at the last
  release up to the pin that changed what the system does for its users.
- Each work's README, term table and scope name the new pin, and `CHANGELOG.md` records the moves.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pins, and the input check already requires a
README and term table that name each work's pinned revision.

## Impact

`publications/aigw-client/` and `publications/openai-responses-proxy/`: the models, overviews, guides, READMEs and
term tables; `CHANGELOG.md`. The described repositories are unchanged. A rebuild of a repository's history keeps its
tag names and changes its commits, so each of the two works is re-pinned once more after its repository's rebuild.
AIGW 0.7.2 is tagged and not yet released; the work takes it when it is.
