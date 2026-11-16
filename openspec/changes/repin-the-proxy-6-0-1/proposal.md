## Why

A work follows its repository's latest release. On 2026-11-16 the OpenAI Responses Proxy released 6.0.1, and its
work pins v6.0.0. The release changes what the proxy writes and does at a response's end: the log names how every
admitted response ended, a client's close during a write is named once and ends the connection, and three faults
are corrected (a reset between two requests on a kept-alive connection was logged as a close; a timed-out write of
an error was answered a second time with `504 upstream_deadline_exceeded`; a stream whose handler failed left its
connection open). Seven of the work's 86 cited files changed, and two of its citations stand on changed lines.

## What Changes

- The work pins v6.0.1 in both languages, with every shifted citation moved and the two touched ones reread.
- What the work says of the end of a response, of the log and of a client that closes agrees with 6.0.1, where the
  work speaks of them.
- The work's history ends at 6.0.1 if the release changed what the proxy does for the role that runs it, and its
  README, term table and scope name the new pin. `CHANGELOG.md` records the move.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pin, and the input check already requires a README
and term table that name the work's pinned revision.

## Impact

`publications/openai-responses-proxy/`: the models, overviews, guides, READMEs and term tables; `CHANGELOG.md`. The
described repository is unchanged.
