# Design

## Context

`package.json` is this repository's toolchain owner because it tracks no mise
configuration. It declares `test`, `format:check` and `format:fix` scripts but no
dependencies, so `format:check` resolves Prettier and taplo from the host's
`PATH`. The ETHOS runtime reports the missing `bootstrap`, `check` and `fix`
verbs as report-only gaps.

## Goals / Non-Goals

**Goals:** expose the three verbs through the toolchain owner and make a
checkout select its own formatters, in one batch with the runtime switch.

**Non-Goals:** changing publications, their inputs, tests or the formatter
settings, adding mise, or adding a remote.

## Decisions

- Lock `prettier` 3.9.10 and `@taplo/cli` 0.7.0, the versions that ETHOS and
  ethos-introduction-film lock, so the common formatter settings produce the
  same output across the fleet.
- `bootstrap` runs `npm ci --ignore-scripts`; `check` runs the formatting check
  and the input tests; `fix` runs the formatters. The gate keeps calling
  `format:check`, which now resolves the locked binaries first.
- `package-lock.json` is npm's output, so Prettier ignores it rather than
  rewriting the lock that npm writes.

## Risks / Trade-offs

- The locked taplo can format TOML differently from the host's newer taplo; the
  locked `check` runs before proof, and any difference is applied with `fix`.
