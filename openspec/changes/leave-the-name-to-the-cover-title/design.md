## Context

See [proposal.md](proposal.md). The Change `settle-the-covers-and-two-names` kept the question, because a page in a
browser takes a work's question as its heading when the work has no guide of its own.

## Goals / Non-Goals

**Goals:**

- A cover says a work's name once, in its title, in both languages.

**Non-Goals:**

- The English questions: they open with "How", and the name stands inside them as their subject.
- The questions of the views: a plate sets its own title above its question, not the work's.

## Decisions

1. Leave the name to the title in Chinese.
   - Rests on: the cover's order (title, question, summary) in the editions Architecture Publisher 0.16.0 builds,
     and the six works' guides: each work names a guide, so no page takes the work's question as its heading.
   - Considered: keeping the name for a page without a guide, as the earlier Change did; no work here has none.
   - Chosen because: a question under its title reads as asked of it, and in Chinese a question without a subject
     is the ordinary form under a heading.
   - Applies to: the six works' Chinese `question`.
2. Hold the rule in the input check, as for the summary.
   - Rests on: the rule the summary already has, which compares the first word of the title.
   - Chosen because: one comparison holds every work and language, and a new work meets it at once.
   - Applies to: `verifyModel`, each work's `question`.

## Risks / Trade-offs

- [A Chinese question reads without a subject where it stands alone, in the data file] → The data file sets the
  work's title beside it, as the cover does.
- [A changed question changes the cover's layout] → The six Chinese editions are built and their covers measured
  before the Change lands.
