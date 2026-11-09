## Context

See [proposal.md](proposal.md). The work pins v5.1.10, `a36a33cf`. Since v5.1.9 the relay imports annotation-only
types under `TYPE_CHECKING` (`79d8334f`), so three relation files no longer import their target at run time: the
listener's entry point loads the provider registry and freezes the payload identity, and passes them in.

## Goals / Non-Goals

**Goals:**

- Every relation the model draws is backed by what its cited files do at the pinned revision, under a rule the work
  states.
- Every behavior-carrying dependency of the lifecycle commands is drawn.

**Non-Goals:**

- Re-pinning the work or rewriting other claims.
- Drawing where the injected objects come from: the listener's entry point is already related to runtime identity, and
  loading the registry is part of starting the listener.

## Decisions

- **Keep the three relations and state the rule they meet.** The relay calls `providers.resolve`, the exchange reads
  `profile.wire_policy` and the handoff calls `committed.handoff()`; each is a call on an object of the other component.
  Removing them would leave the registry unconnected in the portability view though the relay resolves every route
  through it.
- **Draw the new relation in the supervision view.** Every relation of the model is drawn in some view. Installing
  registers supervision and uninstalling removes it, which answers that view's question of who keeps the listener
  running.

## Risks / Trade-offs

- [A seventh card can change how the supervision plate wires or leaves out its reading] → The lane builds both
  editions and checks the plate before landing.
- [The failure panel gains a row] → The edition check measures the overview's text boxes and refuses an overflow.
