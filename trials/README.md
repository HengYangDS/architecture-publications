# Trials

The trials of the first step of Architecture Publisher's roadmap. Each trial's rules stand here in a commit
dated before its first run, and each run's record follows in a dated file that is not edited afterwards. Two sets of
rules are the exception and say so themselves: the author's timing protocol and the items of the figure-reading
check were fixed in working files before their runs and are committed here with their records, as are the
protocol of the page-only timing, the list of the reading of rebuilt plates, and the protocol and tasks of the review
of the existing works.

| Trial    | What it asks                                                                                                    | Rules                                                                                                                                                                                                                                                                                                                                    | Records                                                                                                                                                                                                                          |
| -------- | --------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Reviewer | Can a holder of the reviewer's role find what is wrong in a work?                                               | [procedure](reviewer/procedure.md), [seeded checks](reviewer/seeds.md), [protocol of the review of the existing works](reviewer/2026-11-15-existing-works-protocol.md) with [its task on a model](reviewer/2026-11-15-existing-works-task-model.md) and [on a guide](reviewer/2026-11-15-existing-works-task-guide.md)                   | [false statements, 2026-11-14](reviewer/2026-11-14-false-statements.md); [defects of form, 2026-11-15](reviewer/2026-11-15-defects-of-form.md); [the existing works reviewed, 2026-11-15](reviewer/2026-11-15-existing-works.md) |
| Reader   | Does a work help a reader that can read the repository itself?                                                  | [protocol](reader/protocol.md), [item bank](reader/bank/README.md), [brief of the hand-written page](reader/pages/brief.md)                                                                                                                                                                                                              | [2026-11-15](reader/2026-11-15-record.md)                                                                                                                                                                                        |
| Screen   | Which lines and text can be told apart and read on a screen?                                                    | [definitions](screen/definitions.md), [what the plates' marks mean today](screen/binding-table.md), [figure-reading check](screen/2026-11-15-figure-reading.md), [its pass line on rebuilt plates](screen/2026-11-15-figure-reading-pass-line.md), [the list for reading rebuilt plates](screen/2026-11-15-rebuilt-plate-review-list.md) | [2026-11-15](screen/2026-11-15-comparison.md), [the rebuilt plate read against the pass line](screen/2026-11-15-rebuilt-plate-readings.md), [rebuilt plates read against a list](screen/2026-11-15-rebuilt-plate-review.md)      |
| Author   | What does it cost an agent to write a work on a repository it has never seen, and to move it to a later commit? | [protocol](author/2026-11-14-protocol.md), [page-only protocol](author/2026-11-15-page-only-protocol.md)                                                                                                                                                                                                                                 | [writing, 2026-11-15](author/2026-11-15-writing.md); [re-pinning, 2026-11-15](author/2026-11-15-re-pinning.md); [page only, 2026-11-15](author/2026-11-15-page-only.md)                                                          |

[The outcome](2026-11-15-outcome.md) says what the trials decided and what follows from each.

The scripts that run and score the trials are not in this repository: they start agents and unpack sibling
repositories, and this repository admits no program that does. They are kept with Architecture Publisher's working
records, and each is named here by the SHA-256 of the bytes that ran:

| Script                                                           | SHA-256                                                            |
| ---------------------------------------------------------------- | ------------------------------------------------------------------ |
| `author-page.py`                                                 | `3210e81e323e3e9c930dc838da1cf11ada0ea1a16cfce2c23c4463c1cbbbfffe` |
| `author.py`, the author's timing                                 | `97b4195ed8880158021221a3d5fef441d7299b8864df20c37e69b6d953690ef5` |
| `author.py`, the page-only timing                                | `c33fd35a079153d9e70886136147f06d55252b0a1c78ecdb98baa707970702ad` |
| `measure-geometry.py`, the screen comparison's line measurement  | `6e69a00e3d21e2d00d9f8639892ce16ffc51ba550dd32c86c57ef89bdf32fa72` |
| its output                                                       | `ec8541880bde072a21dc8bbe52f9ff268eb398fdd69463855372942a35ba4e7d` |
| `read-figure.py`, as corrected before its first reading          | `0c688b7e416c7fee1a806510df86faf860f0c775b5702adfc07287cdfcee1e23` |
| `read-rebuilt.py`, the readings of the rebuilt plate             | `675d666e1f43a6a43e9616cd4ed59232a2835390e46b82baec7780a5288b90be` |
| `run-claude-holder.py`, the form check's holder in four sessions | `14927658cabd4b0c93a4d96c87c7c1583a50a4bf5b43ecda2af889ba08efbc6e` |
| `run-review.py`, the review of the existing works                | `52cb5047a2a1883f351f2d1a4085fc6d18d14f3c2a74eb269fb938c11fca5021` |
| `run-reader.py`, as registered                                   | `3dd088026a911e0d0f71753c1253d181b1808fedb1882186ee2c174ecf4a66ea` |
| `run-reader.py`, as corrected on 2026-11-14                      | `34a1c6b6d8d7ef9747c068f12f141a731c559c0b7fbe88b6a961b540515f6c24` |
| `score-e2b.py`, the form check's scorer                          | `0a9d9a557008ad4fdc3d6f4cf5d54b4231f7c40d907f1d8e99b64aa6175f0475` |
| `score-false-statements.py`                                      | `a16fbda2b87da50d8d9a8b0373b246ea8a98c0f915babfd50afd265ba495505b` |
| `score-figure.py`                                                | `3102c9b162e2b53f65276b69e838500bc17b44b6c5adcf8475a9dc9bd58185f9` |
| `score-reader.py`                                                | `c072582be4e27a2ca055e6cb38ed812bae9b3e690ce6e7fb415f07dd18ba4427` |
| `score-rebuilt.py`, their scorer                                 | `0092c5e5062b88e643a47f461764f1976d037fc784e1f8a241ddf3a114089d76` |
| `sensitivity-reader.py`                                          | `46affdb7b2deace0c46cd853eb0fae2dfba7ee5446fc8b3049eb921e1b321b55` |

The questions a work is checked against, and the first matrices filled against them, are in
[questions](../questions/README.md).
