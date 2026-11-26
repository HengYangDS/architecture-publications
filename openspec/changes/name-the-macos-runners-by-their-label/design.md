## Context

See [proposal.md](proposal.md). `.config/ci/verification.toml` names the tags a GitLab macOS job selects its runner
by, and ETHOS's common model writes `.gitlab-ci.yml` from it. The session that keeps the guests' runners
added `macos-latest` and the role tags to the publications' two macOS runners on 26 November 2026 and keeps the
former tags until this repository's main no longer names them.

## Goals / Non-Goals

**Goals:**

- Every GitLab macOS job selects its runner by `macos-latest` and its role.

**Non-Goals:**

- Changing a job, a check, a runner's protection or the GitHub workflow.
- Dropping the former tags from the runners, which their keeper does once main is published.

## Decisions

- The tags are those the publisher's pipeline selects (`macos-latest` with `review` or `protected`), so one runner
  host serves both repositories by one scheme.
- Only the model's two lists move; ETHOS's projection writes the pipeline, and its check holds it to the model.

## Risks / Trade-offs

- [A job selects tags no runner carries] → The proposal's push runs the review job on GitLab, and the landing waits
  for it; the protected job runs on the dev push before main. Restoring the two lists rolls it back while the
  runners still carry the former tags.
