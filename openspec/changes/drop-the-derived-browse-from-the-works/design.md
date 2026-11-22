## Context

See [proposal.md](proposal.md). Architecture Publisher's queue item `one-source` (its contract, "Queue") gives each
fact the product's source forms one place; its research page `docs/research/one-source.md` found every published
work stating its repository's address twice. The publisher's fifth Change of the item derives the browse template
from a GitHub or GitLab address in its normalized model, which its cards, manifest and data read; this is the
publications' half, the sixth Change of the item.

## Goals / Non-Goals

**Goals:**

- Each work states its repository's address once.
- The input check holds it: a template stated beside a GitHub or GitLab address is refused.

**Non-Goals:**

- Refusing such a template in the publisher itself: that refuses a model another release accepted, a breaking change
  the publisher's maintainer decides after this Change has landed (the item's seventh Change).
- The guide's diagram files, whose `meta.repository` repeats the model's block: they belong to the publisher's queue
  item `page-figures`.

## Decisions

- **The check names the two Forges, not the publisher's derivation.** It refuses `browse` beside an `https` address
  on `github.com` or `gitlab.com`, the hosts whose template the publisher derives, without comparing the stated
  template with the derived one: a work there needs no template at all, so a different one would be a mistake too. A
  work on another host keeps stating its template, which nothing derives.
- **The rule's test in a file of its own.** `tests/publication-inputs.test.mjs` stands near the 500 counted lines
  the repository allows; the new test uses the model, directory and writer of `tests/fixtures/works.mjs`, and
  `npm test` runs every test file (both since the Change `reach-every-view-from-the-overview`).
- **Lands after 0.17.0 is the release the works are built with.** Built by 0.16.0, a work without the template has no
  links; the lane starts once 0.17.0 is released and installed.

## Risks / Trade-offs

- A delivery's `model.json` loses one line, so its digest and the files that carry the model (the edition's attached
  model, the page's data) change while what a reader sees does not. The lane builds the twelve editions with 0.17.0
  at its base and head and compares them: the page images and figures equal, the differences confined to the model
  and what carries it.
- The host list stands here and in the publisher. When the publisher refuses the template itself (its seventh
  Change), this check can be dropped.
