## Context

See [proposal.md](proposal.md). `.config/ci/verification.toml` holds the hosted jobs' Mise
release, and ETHOS's common model generates both pipelines from it. GitHub's macOS job installs
Mise through `jdx/mise-action` with that version; GitLab's macOS runner uses the Mise its guest
provides.

Mise 2026.11.1 introduced lockfile format 4 for new lockfiles only; an existing lockfile keeps its
revision until `mise lock --upgrade`. On 8 November, Mise 2026.10.25 and 2026.11.3 both read this
repository's version-3 lock unchanged.

Mise 2026.11.1 also verifies npm provenance by default. This repository declares no `npm:` tool in
Mise; its npm packages install through `npm run bootstrap`, so that change does not reach its jobs.

## Goals / Non-Goals

**Goals:**

- Install Mise 2026.11.4 in the hosted job that bootstraps Mise.

**Non-Goals:**

- Changing any gate, check, publication, runner declaration, the Node release or the declared ETHOS
  release.
- Changing the lockfile format; no step runs `mise lock --upgrade`.
- The Mise that GitLab's macOS runner provides, which its guest owns.
- Raising the Mise floor, which states the oldest Mise that reads this configuration.

## Decisions

- Move only `[supply] mise_version`, and let the native projection regenerate the workflow.
- Leave `jdx/mise-action` as the installed common model pins it; that pin moves with an ETHOS
  release.

## Risks / Trade-offs

- [Mise 2026.11.4 changes the hosted bootstrap] → The proposal's hosted runs on both Forges qualify
  it before landing; restoring the 2026.11.3 parameter rolls it back.

## Migration Plan

Move the Mise parameter, generate both pipelines, prove the archived head and qualify it on
GitHub's and GitLab's macOS jobs. To roll back, restore the 2026.11.3 parameter.
