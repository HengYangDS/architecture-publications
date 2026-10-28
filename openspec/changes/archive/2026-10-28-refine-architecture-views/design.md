# Design

## Context

See proposal.md for the motivation. The AIGW model has an overview of all
twelve components and three mechanism views: the authority (five components),
the adapters (seven) and the transaction (three). The adapters and transaction
views share the client registry and the Adapter contract; the authority and
adapters views share the synchronizer and the Adapter contract.

## Goals / Non-Goals

**Goals:**

- Every AIGW view fills a balanced page of its own.
- The model's prose says what it covers and leaves out, and nothing about
  verification.

**Non-Goals:**

- Changing what the model asserts about AIGW: its components, relations,
  details and sources stay as they are.

## Decisions

- **Merge the transaction view into the adapters view.** The guarded
  transaction is the effect of the operations the Adapter contract admits, so
  one view reads from coordination through admission and dispatch to the guard
  and the native projections. Its tier becomes "Admission, dispatch and guard".
  Dropping the transaction view instead would leave the guarded transaction on
  the overview only, where it is one card among twelve.
- **Keep the authority view.** Its five components and three relations fill a
  page once the publisher may wrap its widest row, and it shares no page.
- **Reword the limits.** "Curated from the cited sources at the pinned
  revision; selected control-plane owners, not every implementation path."
  states coverage; which bytes were read stays in each source's digest and the
  publisher's manifest.

## Risks / Trade-offs

- [The adapters view grows to eight components] → Its rows stay within the
  publisher's row limit; the check builds it on a balanced page.
