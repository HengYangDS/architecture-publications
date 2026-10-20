# Design

## Context

ETHOS renders each authored file with its shared formatter policy and, when this repository
declares one, with the repository's own configuration as an increment. Where the two renderings
differ, the source format gate refuses the file instead of choosing one. This repository's Prettier
configuration predates that rule and still sets `singleQuote = true`.

## Goals / Non-Goals

**Goals:** every proof gate of the bound ETHOS runtime passes, with one quoting rule shared across
the fleet.

**Non-Goals:** changing a publication, the captured source originals or the input tests' behavior.

## Decisions

- Remove the conflicting setting rather than ask ETHOS to accept it: the shared policy is the
  fleet's single formatter authority, and keeping a repository-specific quote style would need a
  per-repository exception.
- Rewrite the two files with `ethos lane format`, the owner that ETHOS format selection names, so
  that the bytes are the formatter's own output.

## Risks / Trade-offs

- [Prettier rewrites string quotes in test and tool code] → Quote style does not change what a
  JavaScript string holds, and `npm run check` runs the same input tests afterwards.
