## Context

See [proposal.md](proposal.md). The publisher sets a view's summary beside its
figure when the figure leaves part of the body. With summaries on every view,
Architecture Publisher 0.10.1 refused 19 of the 82 plates, English and Chinese,
because the summary and the paths together were taller than the body.
Shortening the summaries barely changed that. 0.10.2 sets the summary alone in
that case, and every plate builds.

## Goals / Non-Goals

**Goals:**

- Every view answers its question in a sentence or two beside its figure, in
  both languages.
- A view added later without a summary fails the input check.
- Both re-pinned works describe their repositories as released.

**Non-Goals:**

- Making each language's directory hold the same files, which a later Change
  takes on.
- Pinning Architecture Publisher in this repository's Mise configuration; the
  checks here never run the publisher.
- Tagging this repository's first release, which the owner decides separately.

## Decisions

- **A summary says only what its model says.** Each is drawn from the view's
  question, its members' labels and details and the relations among them.
  Where a model does not state an order or an owner, the summary names who
  holds each part and implies no sequence.
- **The input check owns the rule, not the publisher.** The publisher reads a
  view without a summary, as other adopters may want it to. Requiring one is
  this repository's editorial choice, like a view's title.
- **Re-pin in the same Change.** Both works rebuild for their summaries, so
  moving them here costs one build and one check instead of two.
- **`relay/wire_recovery.py` joins the upstream exchange.** It is the DMXAPI 477
  retry moved out of `exchange.py`, which alone calls it, so the directory claim
  of the Responses relay would have misplaced it.

## Risks / Trade-offs

- A summary can drift from its model as a work is re-pinned: the re-pin worklist
  covers citations, not summaries. Mitigation: each re-pin rereads the text that
  cites no line, and these summaries are part of that text.
- The proxy's overview has no row for the release's new input-length recovery;
  its failure panel is full and selective, and the guide's failure table
  carries the new row.
