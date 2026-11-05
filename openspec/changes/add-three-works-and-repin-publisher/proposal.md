## Why

The owner asked for a static and a dynamic architecture picture of the Data
Department Work Guidelines, filmkit and the OpenAI Responses Proxy, and for every
work to follow its repository's latest release. The Architecture Publisher work
still describes `97c2079` of 2026-11-02, before the guide pages, file claims and
re-pin worklist that its v0.8.0 release delivers; four of its source files belong
to no component there.

## What Changes

- Three works, each pinned at its repository's latest release, each with one
  poster per view, an overview composition and a guide as its page:
  - Data Department Work Guidelines at v8.0.0 (`b9da15d`): how a reader reaches
    the topic that owns a task's rule, and how a change to the guidelines is
    proposed, checked and released.
  - filmkit at v0.9.0 (`0d56c27`): how filmkit rebuilds a film's two editions
    from its tracked sources, and what holds each step to its inputs.
  - OpenAI Responses Proxy at v5.1.9 (`a5cfd8c`): how the proxy makes a Codex
    Responses turn portable across third-party providers, and how it installs
    and keeps its own listener running.
- The Architecture Publisher work moves to v0.8.0 (`a2f4224`). Model migration,
  the guide, the coverage scope and the re-pin worklist become components of
  their own; its scope adds the package manifest and the supply manifests; and
  it gains a guide in place of the generated page.
- The repository README lists the new works, and the input test expects six.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None.

## Impact

`publications/ddwg/`, `publications/filmkit/`,
`publications/openai-responses-proxy/`, `publications/architecture-publisher/`,
`README.md` and `tests/publication-inputs.test.mjs`. The ETHOS work stays at
v0.2.0-alpha.28 until ETHOS publishes its beta; the AIGW work is already at its
latest release, v0.6.0.
