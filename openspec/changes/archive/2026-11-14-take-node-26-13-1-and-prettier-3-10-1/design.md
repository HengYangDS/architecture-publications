## Context

See [proposal.md](proposal.md). The repository's format check runs Prettier through its own npm
script with `.config/checks/prettier/prettier.toml`; its Node comes from Mise.

## Goals / Non-Goals

**Goals:**

- Run the repository's tools on Node 26.13.1 and Prettier 3.10.1.

**Non-Goals:**

- Changing any work, record, check or pipeline.
- Moving any other tool or the ETHOS binding.

## Decisions

- Move both in one Change, because one proof covers both and neither changes a tracked file beyond
  the declarations.
- Check before the lane that Prettier 3.10.1 reformats nothing: with the repository's configuration
  and ignore file, `prettier --list-different .` over the accepted tree lists no file. The records
  under `trials/` and `questions/` keep their bytes.

## Risks / Trade-offs

- [The hosted macOS job uses another Node] → The hosted jobs install the locked Node through Mise,
  so they take 26.13.1 from the lock.
- [A later Prettier release reformats a record] → That release's lane stops before committing and
  decides between the formatter's ignore control and holding Prettier.

## Migration Plan

Move the declarations, lock, install, run the checks, prove the archived head and qualify it on
both Forges. To roll back, restore the two declarations and their locks in a new Change.
