## Context

See [proposal.md](proposal.md). The re-pin of five works moved this work to v7.0.1 (dev 5fa0f95); the proxy
released v7.0.2 at 14:30 on 2026-11-27, after that lane landed on dev (14:05). `archpub check --repo <checkout> --against v7.0.2`, run with
the released Architecture Publisher 0.19.0, lists 1 commit, 7 of 85 files in scope modified, citations 136 the same,
49 shifted and 7 touched, 6 components and 12 relations to reread, nothing refused or uncovered. The move adds one citation, the
changelog's 7.0.2 section, so each model verifies 193.

## Goals / Non-Goals

**Goals:** the work describes v7.0.2, with every claim cited at it and every file in scope owned.

**Non-Goals:** the guides' stated positions and sizes, which the publisher's queue item `page-figures` removes once
Archify's release allows it, as in the re-pin of five works.

## Decisions

1. Move each shifted citation mechanically; reread each touched one; withdraw the words 7.0.1 added where 7.0.2
   withdrew what they describe, each sentence taken from the source at v7.0.2.
   - Rests on: the worklists, and the release's own account of what it removes.
   - Considered: restoring the work's v7.0.0 wording file by file.
   - Chosen because: v7.0.2 is not v7.0.0 (the history and the citations moved); a sentence is right when it agrees
     with its source at the pin.
   - Applies to: the guide, its diagram files and both models.
2. Verify with the released Architecture Publisher 0.19.0: 0.20.0 and later refuse the positions and sizes the
   guides state, as the repository's README says.

## Risks / Trade-offs

- [The proxy releases again before this lane lands] → The lane's step refuses a pin that is not the repository's
  latest stable release when it runs.
