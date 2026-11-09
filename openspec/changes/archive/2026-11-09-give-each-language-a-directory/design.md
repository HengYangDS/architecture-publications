## Context

See [proposal.md](proposal.md). The input check reads a work's root model as the original and each directory named
by a locale the publisher reads as a translation of it, which must hold `concepts.md`. Two works hold `source.json`,
whose members are all read from the preservation commit at the paths they had there.

## Goals / Non-Goals

**Goals:**

- Every language of a work is a peer: the same files at the same paths, in a directory named by its language.
- The input check keeps the layout, so no review has to.

**Non-Goals:**

- A README in each language: the repository's documents are in English.
- Moving `source.json` or its member paths, which name files at the preservation commit, not in the current tree.
- Adding a language, or changing the Chinese models' locale `zh-CN`, which the publisher needs for typesetting.

## Decisions

- **A directory is named by its model's language.** The name is the locale's language subtag, lowercase: `en` for
  `en`, `zh` for `zh-CN`. A region or script would join the name only when two variants of one language coexist,
  and none does.
- **Every model names its locale.** The English models name `en` explicitly, so each directory declares its
  language, and the check does not rely on the publisher's default.
- **No language is the original.** The check compares the models' id and revision and the directories' files across
  all languages, and names the first language in order as the reference in its refusals.
- **The term table belongs to the work.** `concepts.md` maps each English term to its Chinese rendering and its
  defining file, so it sits beside the languages rather than inside one; its introductions name `zh/model.json` and
  `zh/overview.typ`, the files whose wording it fixes.

## Risks / Trade-offs

- [Tooling outside this repository builds from the old paths] → Only local delivery scripts do, and they are updated
  with the lane; `git mv` keeps each file's history reachable with `git log --follow`.
- [`[0.1.0]` still describes a `zh-CN` translation] → It records the tree that version was cut with; the move is
  recorded under `[Unreleased]`, so no entry rewrites what an earlier version held.
