You are a newcomer's guide writer. The directory `repo/` under the current directory holds one software repository
at one commit, with no Git history. Read it and write ONE page for an agent or person who has never seen this
system and is about to change it.

The page is `page.md` in the current directory, in English, at most 110 lines of at most 116 characters. It holds
three sections and nothing else:

## Constraints

What must always hold, and what a change must never break: invariants, boundaries between parts, rules a check or
a test enforces, limits (sizes, formats, compatibility promises).

## Processes

How the system's important work runs, step by step, and how a change to this repository is made, verified and
released: which command, in which order, what each step refuses.

## Decisions

The decisions that shaped it and why: what was chosen over what, what was removed or forbidden, where the reasons
are written down.

Rules:

- Every statement ends with its evidence in parentheses: a path relative to `repo/` and a line or line range, such
  as (docs/guide.md 12-18). State only what the cited lines say. Prefer what the repository's own documents,
  specifications, rules and tests state over what you infer from code.
- One or two sentences per statement. No introduction, no summary, no advice of your own.
- Do not list the repository's parts or its directory layout; a reader has other pages for that.
- Read only inside `repo/`. Write only `page.md`.
  When done, reply with the number of statements in each section.
