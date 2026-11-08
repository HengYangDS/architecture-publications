## Context

See [proposal.md](proposal.md). Architecture Publisher reads one model in one language and sets its own words in
that language. A translation is therefore a second model of the same architecture: the same components, relations,
views, claims and citations, with its text in another language.

## Goals / Non-Goals

**Goals:**

- The repository holds exactly the Chinese sources the owner received, so each delivery can be rebuilt.
- A translation cannot drift from its original's id or revision unnoticed.

**Non-Goals:**

- The owner's review of the renderings the translations chose, which a later change applies.
- Checking that a translation's components and relations match its original's; the publisher's own check covers
  each model against its revision.

## Decisions

- **A translation lives in a directory named by its locale, inside its work.** The work keeps one id, so its
  editions in either language publish under one name, and the work's directory holds everything about it.
- **The check binds the translation to its original.** Its model must declare the directory's locale, the
  original's id and the original's revision, so a re-pin that forgets the translation fails the check.
- **Each translation carries its term table.** `concepts.md` fixes each rendering with the file that defines the
  term, so a reviewer can check the words without reading every sentence.
- **The English faults are corrected in the same change.** The translations were prepared from the corrected
  English, and the owner received both.

## Risks / Trade-offs

- [A work moves to a new release and its translation keeps the old revision] → The check refuses a translation
  whose revision differs from its original's, so both move together.
- [The renderings the owner has not yet reviewed are committed] → They are what the owner received; a later change
  applies the owner's choices to both the edition and the page.
