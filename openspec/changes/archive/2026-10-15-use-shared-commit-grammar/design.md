# Design

## Context

See proposal.md for motivation. The removed pattern is
`^(feat|fix|docs|test|refactor|perf|build|ci|chore|revert)(\([a-z0-9-]+\))?!?: .+`,
which the shared grammar of ETHOS `b8e0d3ce5` reproduces. Commit admission
compiles the staged workspace with the installed runtime.

## Goals / Non-Goals

**Goals:** keep the admitted subjects and signing unchanged while the commit
policy stops restating the shared grammar.

**Non-Goals:** declaring a scope list, which this repository has never
restricted, or changing any other policy.

## Decisions

- The hooks switch to runtime 7ee760d5 before the change, because runtime
  fe71c069 reports a commit policy without `subject_pattern` as
  `commit_policy_invalid:subject_pattern`.
- The commit that removes the pattern is itself admitted under the derived
  grammar, which proves the order.

## Risks / Trade-offs

- [The derived grammar differs from the removed pattern] → both admit the same
  ten types, kebab-case scopes and the breaking marker; the full proof and the
  commit admission of this Change run under the derived grammar.
