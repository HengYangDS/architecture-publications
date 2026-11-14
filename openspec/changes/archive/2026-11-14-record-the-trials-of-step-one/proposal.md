## Why

The trials of the first step of Architecture Publisher's roadmap have run. Their rules were registered here before
the runs, and each rule file says that a run's record follows it here. The records are in the publisher's working
directory, which is not kept: the reader experiment's runs, the reviewer's check on defects of form, the screen
comparison with its figure readings, and the author's timing. The roadmap's later steps build on what these
decided, so the decisions need a place that lasts.

## What Changes

- `trials/` gains each trial's dated record with its data: the reader experiment's record and every run; the form
  check's record, key, brief and both holders' findings; the screen comparison's record, the figure-reading check's
  items and every reading; the author's timing protocol and the records of its two parts.
- `trials/2026-11-15-outcome.md` says what each trial decided against its line and what follows for the roadmap.
- `trials/README.md` lists the records, adds the author's trial, names the scripts that ran by SHA-256, and says
  which two rule files were not committed before their runs.
- `CHANGELOG.md` records the addition.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. The input check and the format check already cover `trials/`.

## Impact

`trials/` and `CHANGELOG.md`. No work, model or question changes. The five candidate defects of the work on Film
Kit that the false-statements check raised stay listed in that check's record and are not corrected here.
