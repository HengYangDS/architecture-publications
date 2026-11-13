## Context

See [proposal.md](proposal.md). `.config/ci/verification.toml` holds the hosted jobs' Mise release,
and ETHOS's common model generates both pipelines from it. GitHub's macOS job installs Mise through
`jdx/mise-action` with that version; GitLab's macOS runner uses the Mise its guest provides.

Mise 2026.11.6 and 2026.11.7 add task pickers, bootstrap-package and dot-file features, and fix,
among others, long cache keys in the `http:` backend, the GitHub fallback on 5xx errors, and
`mise lock` sending the forge token when it downloads an asset to compute a checksum. None of these
changes the locked install that the hosted job runs, and an existing lockfile keeps its version
until `mise lock --upgrade`.

## Goals / Non-Goals

**Goals:**

- Install Mise 2026.11.7 in the hosted job that bootstraps Mise.

**Non-Goals:**

- Changing any gate, check, publication, runner declaration or the Node release.
- Changing the lockfile format; no step runs `mise lock --upgrade`.
- The Mise that GitLab's macOS runner provides, which its guest owns.
- Raising the Mise floor, which states the oldest Mise that reads this configuration.

## Decisions

- Move only `[supply] mise_version`, and let the native projection regenerate the workflow.
- Leave `jdx/mise-action` as the installed common model pins it; that pin moves with an ETHOS
  release.

## Risks / Trade-offs

- [Mise 2026.11.7 changes the hosted bootstrap] → The proposal's hosted runs on both Forges qualify
  it before landing; restoring the 2026.11.5 parameter rolls it back.

## Migration Plan

Move the Mise parameter, generate both pipelines, prove the archived head and qualify it on GitHub's
and GitLab's macOS jobs. To roll back, restore the 2026.11.5 parameter.
