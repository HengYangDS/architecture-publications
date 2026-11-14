# Question matrices: result of step 1(b)

2026-11-14. Three works graded by hand, each by one read-only agent, at the work's pin. Mechanical checking reached
"the cited file or line range exists at the pin"; no agent judged whether cited lines support a statement.

## First pass: thirteen compound entries

| Work                  | Cited | Not applicable | Silent |
| --------------------- | ----- | -------------- | ------ |
| ETHOS (v0.2.0-beta.9) | 13    | 0              | 0      |
| Film Kit (v0.21.2)    | 12    | 0              | 1      |
| DDWG (v8.0.0)         | 12    | 1              | 0      |

All three graders found the same defect independently: ten of the thirteen questions join two or three clauses, and
one answered clause made the whole entry count. The roadmap's rule for this case applies: the table is too loose,
so it is split.

## Second pass: twenty-seven entries, one clause each

| Work     | Cited | Not applicable | Silent | Silent entries (the repository's own answer)                                                                                                                           |
| -------- | ----- | -------------- | ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ETHOS    | 21    | 3              | 3      | `release` (docs/guides/release-and-publication.md), `installed-and-run` (docs/architecture/distribution.md), `goals`: who answers for it (not found in the repository) |
| Film Kit | 21    | 3              | 3      | `changing-it` (CONTRIBUTING.md), `release` (CONTRIBUTING.md), `direction` (not found in the repository)                                                                |
| DDWG     | 24    | 1              | 2      | `direction` (not found in the repository), `owned-by` (docs/charter.md)                                                                                                |

A stricter grader, who asks for a sentence whose subject is the question, gives Film Kit 19, 3, 5.

## What the matrices establish

1. Completeness is not the gap the 2026-11-14 retrospective named. The works answer most entries, but in the guide:
   of the cited entries, the guide alone answers 12 of 21 (ETHOS), 12 of 21 (Film Kit) and 9 of 24 (DDWG); the model
   alone answers 2, 1 and 0. The print edition sets only what the model holds.
2. A work is two works. The model draws on the files in its coverage scope; ETHOS's guide takes 63 of its 84 sources
   from outside that scope.
3. No statement of an `overview.typ` carries a citation, so none counts; ETHOS states its release step there only.
4. Where a work is silent, the repository usually answers: five of the eight silent entries have a file at the pin.
   The three others (`direction` twice, who answers for ETHOS) are silent in the repository too.
5. For a repository of guidance the table fits: one entry of 27 is not applicable. It needed three entries of its
   own: whom the guidance binds, who owns it, and whether it is in use.
6. Thin answers pass. One diagram node or one table row makes an entry cited. The state says a cited statement
   exists, never that the question is well answered; that judgement is the reviewer's.

## Still to settle before the table is committed

- Entries that still join two clauses: `goals` (what it must achieve; who answers for it), `installed-and-run`,
  `what-it-is-not`, `interfaces`, `decisions`, `owned-by`. Split `goals` and `owned-by`; the graders differed on the
  others.
- Code size and file age, which every plate draws: for DDWG size is reading length and age separates nothing (47 of
  48 files changed within three weeks).
