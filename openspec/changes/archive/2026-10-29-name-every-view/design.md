# Design

## Context

See proposal.md for the motivation. The AIGW model's three views declare a
question but no title. The ETHOS overview declares neither and asks the model's
question; its three mechanism views are titled.

## Goals / Non-Goals

**Goals:**

- Every view of every work is named by a title of its own on its poster and on
  the page.

**Non-Goals:**

- Changing what a model asserts: components, relations, details, sources, pins
  and questions stay as they are.

## Decisions

- **Short titles that name the subject.** Overview, Authority and Adapters
  name what each AIGW view shows; the question under each title asks what it
  answers. A title that restated the question would repeat it on the poster.
- **Check the titles where the inputs are checked.** The input test already
  reads every model; it now refuses a view without a title of its own, so a
  later work cannot repeat the gap.

## Risks / Trade-offs

- [A later poster's head grows by one line, the model's title above the view's]
  → The publisher refuses a page it cannot balance; the build of both works is
  the check.
