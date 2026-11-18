## Why

A work follows its repository's latest release. Film Kit released 0.23.0 and 0.23.1 on 2026-11-18 and its work pins
v0.22.3; the OpenAI Responses Proxy released 6.0.2 and 6.0.3 on 2026-11-17 and its work pins v6.0.1.

Film Kit 0.23.0 changes what the engine does at several places the work describes: `check-picture` runs a fourth
audit, the detail audit; an uncaptioned picture may be derived from the captioned one, and a renderer is qualified
for it; the 1080p films are encoded in software; `preflight` asks for more records and writes a readiness receipt;
every command writes a duration record; a narration divides its segments among processes; and the delivery folder
is named by the film, in a module that moved (`filmkit.delivery.documents_folder` is now `filmkit.delivery.folder`).
0.23.1 moves the speech and render supply. One cited file moved, 28 changed, 31 citations stand on changed lines,
and 15 files in the work's scope are new and owned by no part.

The proxy's 6.0.2 changes when a failed handoff restores the previous release, and 6.0.3 reads an installed payload
only through the generation the selector names and changes what `status` and `uninstall` do without one. 28 of the
work's 86 cited files changed, and 28 citations stand on changed lines.

## What Changes

- The Film Kit work pins v0.23.1 and the proxy's work v6.0.3, each in both languages, with every shifted citation
  moved and every touched one reread.
- What each work says agrees with its release where the work speaks of what the release changed. Film Kit's moved
  file is claimed and cited at its new path, and each new file in scope is owned by a part.
- Each work's history takes the releases that changed what the system does for the roles that use it, and its
  README, term table and scope name the new pin. `CHANGELOG.md` records the moves.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pin, and the input check already requires a README
and term table that name the work's pinned revision.

## Impact

`publications/filmkit/` and `publications/openai-responses-proxy/`: the models, overviews, guides, READMEs and term
tables; `CHANGELOG.md`. The described repositories are unchanged.
