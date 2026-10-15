# Change: Use The Shared Commit Grammar

## Why

ETHOS `b8e0d3ce5` made the commit grammar a repository paradigm value:
`[commit_policy]` without `subject_pattern` derives the shared grammar of ten
types, an optional kebab-case scope and the `!` breaking marker. ETHOS 2.15
will report a restated `subject_pattern` as a paradigm gap. This repository
restates exactly that grammar, so the restatement is removed before the gap
exists.

## What Changes

- Remove `subject_pattern` from `[commit_policy]` in `.ethos/workspace.toml`
  and keep `signing_required` and `signing_format`.
- Record that the hooks moved to runtime 7ee760d5 first, because the previous
  runtime refuses a commit policy without `subject_pattern`.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. Publication inputs and their verification are unchanged, so
`.openspec.yaml` sets `skip_specs: true`.

## Impact

Only `.ethos/workspace.toml` changes. Commits keep the same admitted subjects
and the same SSH signing requirement. `tasks.md` is the sole progress ledger.
