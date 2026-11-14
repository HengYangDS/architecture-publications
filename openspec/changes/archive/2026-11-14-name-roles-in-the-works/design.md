## Context

See [proposal.md](proposal.md). The wording stands in nine files of two works: 23 places say 「审阅人」, one tier
label says 「人员」, five places say 「运维人员」, and one English tier label says `People`.

## Goals / Non-Goals

**Goals:**

- No Chinese work names a role's holder as a person, and a test keeps it so.

**Non-Goals:**

- The English guide of the ETHOS work, which says that people, AI agents and programs each reach ETHOS through a
  surface of their own. That sentence describes three kinds of caller the system distinguishes; it presumes
  nothing about who holds a role.
- The model's kind category `person`, which is Architecture Publisher's field and changes with its next model
  version.
- Rebuilding the works' review set, which follows the publisher's next release.

## Decisions

- Replace the words where they stand and change nothing else: 「审阅人」 becomes 「审阅者」, the tier label 「人员」
  becomes 「角色」, 「运维人员」 becomes 「运维者」, and the English tier label `People` becomes `Roles`. Each new word
  is as long as the old or shorter, so no plate needs more room.
- The test reads every file under a work's `zh/` directory and its term table and refuses the two words. It
  covers 「人员」 whole, so 「运维人员」 and any later compound are refused with it.

## Risks / Trade-offs

- [A later work needs 「人员」 for people a system really addresses] → the test names the file and line, and the
  Change that needs the word narrows the test with its reason.

## Migration Plan

None.

## Open Questions

None.
