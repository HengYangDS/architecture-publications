## Context

See proposal.md for why the model moves. Every work here is one
`publications/<id>/` directory with `model.json`, a README and, for works whose
history is preserved, `source.json`. The model is read by the released
publisher; its sources are checked against a checkout of the described
repository.

## Goals / Non-Goals

**Goals:**

- The work is the authoritative home of the model, and the 0.7.0 posters stay
  reproducible from the unchanged model in Architecture Publisher's history.

**Non-Goals:**

- Pinning a newer Architecture Publisher revision or editing what the model
  describes.
- A `source.json`: no earlier artwork of this work needs preserving.

## Decisions

- **Copy the model, changing only its attribution.** The publisher repository
  named its own maintainers as the editor. Here the editor is this repository,
  as for every work, so the attribution says so in the other works' form. The
  attribution is printed on the posters and the page, so the next delivery of
  this work differs from 0.7.0 in that line. Built from the unchanged model,
  the posters stay byte-identical to 0.7.0. Editing what the model describes
  while moving it would mix two reviews into one.
- **Keep the model id `architecture-publisher`.** The delivery directories under
  the publication root already use it, so readers keep one identity.

## Risks / Trade-offs

- [The model pins a revision 24 commits behind the publisher's dev] → Moving it
  does not change what it describes. Pinning a newer revision is the next
  editorial change of this work.
