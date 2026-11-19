## Context

See [proposal.md](proposal.md). The owner set a 24-hour release age for every governed repository on
19 November 2026 and asked that each repository write it in its own configuration; a repository that
writes none takes the default of ETHOS's common base. This repository's Mise configuration sets
`locked = true` and declares Node, and writes no release age.

## Goals / Non-Goals

**Goals:**

- State this repository's release age in its own Mise configuration.

**Non-Goals:**

- npm's release age, which needs npm to read a repository-owned configuration first; a later Change
  takes it after `npm ci` under it passes on this repository's lock.
- An exemption list: Mise and npm resolve no source here that the owner maintains, so no release
  waits for its age.
- Changing any gate, check, publication, the Node release or the lockfile.

## Decisions

- Declare the value as `minimum_release_age = "24h"` beside `locked = true`, the form the governed
  repositories that already declare an age use.

## Risks / Trade-offs

- [A hosted runner's Mise does not know the setting] → The hosted jobs of other governed
  repositories already run with this setting on both Forges; the proposal's hosted runs qualify it
  here before landing, and removing the line rolls it back.

## Migration Plan

Add the setting, prove the lane's archived head and qualify it on both Forges' jobs; Archpub lands
it with the lane's other Change. To roll back, remove the line.
