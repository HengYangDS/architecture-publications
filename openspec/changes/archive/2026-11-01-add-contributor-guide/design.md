## Context

See [proposal.md](proposal.md). The README explains the works and how to build and publish them for
readers; `AGENTS.md` sends agents to the installed ETHOS product. Neither tells a contributor what a
change here may touch or which checks and review it passes.

## Goals / Non-Goals

**Goals:**

- One guide states the repository's own scope: what a work holds, how a model is checked against its
  source, where deliveries live and who accepts them, the local checks, and the lane workflow.

**Non-Goals:**

- Repeating the publisher's or ETHOS's own documentation; the guide names their commands and leaves
  their behavior to them.
- Changing any work, test, tool or check.

## Decisions

- **The guide states boundaries, not a tutorial.** Each section answers one question a contributor
  has before changing a work, and each command it names exists in `package.json`, the publisher or
  the installed ETHOS.
- **Review stays with a person.** The guide repeats the README's rule that only the reviewer accepts
  a delivery, and says that an agent prepares builds without accepting them.

## Risks / Trade-offs

- [The guide drifts from the README] → It restates only what the README and `package.json` define,
  and refers to the README's commands rather than redefining them.
