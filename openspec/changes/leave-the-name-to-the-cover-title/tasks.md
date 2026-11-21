## 1. The questions and the rule

- [x] 1.1 Set the six Chinese questions and the rule with its test. Done when every model verifies and the input tests pass. `apply.py` of the maintainer's `cover-questions/` record set the six questions, the rule and its test; the input tests and the check pass in the lane.
- [x] 1.2 Have a reader other than the writer read the six questions under their titles. Done when the reader confirms. A reader other than the writer read the six questions under their titles and confirmed (`read-zh.md` of the same record).
- [x] 1.3 Build the six Chinese editions from a tree equal to the lane's works and measure their covers. Done when no line is spread past the house's limits. The six Chinese editions built by Architecture Publisher 0.16.0 at 10:54 from a tree whose works hold these questions (`cover-questions/tree`) have no line spread past the house's limits by `wide-gaps.py`, `tracked-cjk.py` or `loose-lines.py`.

## 2. Record

- [x] 2.1 Record the change in `CHANGELOG.md`. Done when `mise run check` passes. `CHANGELOG.md` records the rule under Added and the questions under Changed; `mise run check` passes.
