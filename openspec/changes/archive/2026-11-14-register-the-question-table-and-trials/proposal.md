## Why

Architecture Publisher's roadmap, written by a committee on 2026-11-14, opens with a step that writes no product
code: it tests on paper and by experiment whether the works answer what a reader needs, whether an agent can hold
the reviewer's role, and whether a work helps a reader that can read the repository itself. Its protocol asks that
each trial's items, scoring, pass line and isolation rules be committed here before the trial runs, and that every
run's record follow. The question table the works are checked against belongs to this repository by the same
design: the publisher knows an entry's three states and none of its questions.

## What Changes

- `questions/` holds the question table, 27 entries that each ask one thing, three of them for repositories of
  guidance, and the matrices of three works filled against it by hand on 2026-11-14.
- `trials/reviewer/` holds the reviewer's procedure, the seeded checks and their pass lines, and the record of the
  first run on false statements, which two holders of different origin passed.
- `trials/reader/` holds the reader experiment's protocol, its item bank with the answers, and the two
  hand-written pages of its fourth arm, all fixed before a subject is shown an item.
- `trials/screen/` holds the definitions and the stop line of the comparison of lines on screen, fixed before
  anything is rendered, and the table of what each mark on a plate means today.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: the repository holds one question table, and a test holds it to its form. The trials'
  files are records that no check reads.

## Impact

Two new directories, `questions/` and `trials/`, one test in `tests/publication-inputs.test.mjs` and
`CHANGELOG.md`. No work, citation or pin changes.
