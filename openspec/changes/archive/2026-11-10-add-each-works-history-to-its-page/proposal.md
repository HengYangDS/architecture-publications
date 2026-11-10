## Why

Each work's page explains how its system is built, but not how the system got here, what file its reader writes,
or which values it fixes. Readers ask all three, and each answer is in the described repository: its CHANGELOG and
tags, its declared configuration, and the constants and limits its sources state.

Architecture Publisher has also released 0.11.0 and Film Kit 0.19.0, and their works still pin v0.10.2 and v0.18.0.

## What Changes

- Each work's page gains a history panel: a timeline of the releases that changed what the system does for its users,
  up to the pinned revision, each event at its tag's time and citing its CHANGELOG section.
- Where a work's contract with its reader is a file the reader writes or reviews, the page quotes it from the pinned
  revision with Archify's code excerpt, in the panel that explains it.
- Where the sources fix values a reader needs, such as defaults, limits and supported platforms, the page lists them in
  a facts table that cites them.
- Architecture Publisher's work pins v0.11.0 and Film Kit's v0.19.0, with every citation moved or reread by the re-pin
  worklist, and each history includes its pinned release.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. The input check already requires both languages to hold the same files, and `archpub check --repo` verifies
every new citation at the pin.

## Impact

`publications/<work>/{en,zh}/guide/` for the six works: the guide and a new `history.timeline.json` each; Architecture
Publisher's and Film Kit's models, overviews, READMEs and term tables for their re-pins; `CHANGELOG.md`. The described
repositories are unchanged.
