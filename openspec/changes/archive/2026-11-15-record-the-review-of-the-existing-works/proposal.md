## Why

Architecture Publisher's roadmap asks, in its first step, that the existing works be reviewed once under the
reviewer's procedure after the seeded checks are passed: the review "may accept or refuse, takes one day at most and
belongs to the publications side; defects found go to the queue and are not fixed in place". The step's outcome was
recorded here on 2026-11-15 without that review, and nothing here says so.

The review was made the same day. A holder of another origin than the works' author judged every statement of the
six Chinese editions against the described repositories at the works' pins: 1996 statements, 1389 supported, 346 not
supported, 261 that carry no evidence to judge. Each finding was then read against the pin and classed. By the
procedure one unsupported statement refuses a work, and every work has such statements.

## What Changes

- `trials/reviewer/2026-11-15-existing-works.md` records what was reviewed and what was not, the verdicts by work,
  the class of each finding, a correction about the times on the works' timelines, what repeats, the limits, and
  where the findings go.
- `trials/reviewer/2026-11-15-existing-works-verdicts.json` holds the reviewer's twelve records as returned, and
  `trials/reviewer/2026-11-15-existing-works-confirmation.json` each finding with its class, what the work says and
  what the pin says.
- `trials/reviewer/2026-11-15-existing-works-protocol.md` and the two tasks the reviewer was given are committed as
  they were fixed before the run.
- `trials/README.md` names them in the reviewer's row, says that these rules were fixed in working files, and names
  the runner by digest.
- `trials/2026-11-15-outcome.md` is not edited: a record is not changed after its run. The new record says what the
  outcome left out.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None.

## Impact

`trials/` only. No work is corrected: the findings are the input of the roadmap's item `six-works`.
