## Context

See [proposal.md](proposal.md). A work pins one full commit of its repository.
`archpub check --against <commit>` reports, for that commit, each owned file's
fate, the claims and relation files a build there would refuse, the files no
claim covers, and each cited line range as the same, shifted, moved, touched or
gone.

## Goals / Non-Goals

**Goals:**

- Each of the three works describes its repository as released, with every file
  of its scope owned and every guide claim cited at the new release.

**Non-Goals:**

- Re-pinning the ETHOS work, whose guide shows a proof of its own version.
- Changing what a work shows beyond what its release changed.

## Decisions

- **Apply the worklist, then read what it cannot judge.** A shifted citation
  moves to its new range only when the text there is the text cited before. A
  touched citation is read again at the release, its range set to what the claim
  still needs, and its claim rewritten only where the release changed it.
- **Read what the check cannot see.** `archpub check` verifies coverage and
  every cited range, not a count, version or list that cites no line. Each such
  statement in the three works is read against its release, and so is each
  relation whose files the release modified.
- **New files go to the component their module serves.** filmkit's
  `preflight.py` checks a render's inputs for the production command, and
  `text_trace.py` measures text for the picture gate, beside `gates.py`, which
  calls it.
- **A relation keeps its claim when the release only moves its code.** AIGW
  folded its two platform password files into `password.go`; the relation keeps
  the files that remain.
- **The diagram files move with the model.** Each guide diagram names the
  revision its sources are read at, so each moves to the new release.

## Risks / Trade-offs

- [A touched citation still reads differently than its claim] → Each of the 14
  was read at the release, and `archpub check` with Architecture Publisher 0.9.0
  verifies every cited range at the new revision.
