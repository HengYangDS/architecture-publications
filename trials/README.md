# Trials

The trials of the first step of Architecture Publisher's roadmap. Each trial's rules stand here in a commit
dated before its first run, and each run's record follows in a dated file that is not edited afterwards.

| Trial    | What it asks                                                      | Rules                                                                                                                       | Records                                                                 |
| -------- | ----------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| Reviewer | Can a holder of the reviewer's role find what is wrong in a work? | [procedure](reviewer/procedure.md), [seeded checks](reviewer/seeds.md)                                                      | [false statements, 2026-11-14](reviewer/2026-11-14-false-statements.md) |
| Reader   | Does a work help a reader that can read the repository itself?    | [protocol](reader/protocol.md), [item bank](reader/bank/README.md), [brief of the hand-written page](reader/pages/brief.md) | none yet                                                                |
| Screen   | Which lines and text can be told apart and read on a screen?      | [definitions](screen/definitions.md), [what the plates' marks mean today](screen/binding-table.md)                          | none yet                                                                |

The scripts that run and score the trials are not in this repository: they start agents and unpack sibling
repositories, and this repository admits no program that does. They are kept with Architecture Publisher's working
records, and each is named here by the SHA-256 of the bytes that ran:

| Script                      | SHA-256                                                            |
| --------------------------- | ------------------------------------------------------------------ |
| `author-page.py`            | `3210e81e323e3e9c930dc838da1cf11ada0ea1a16cfce2c23c4463c1cbbbfffe` |
| `run-reader.py`             | `3dd088026a911e0d0f71753c1253d181b1808fedb1882186ee2c174ecf4a66ea` |
| `score-false-statements.py` | `a16fbda2b87da50d8d9a8b0373b246ea8a98c0f915babfd50afd265ba495505b` |
| `score-reader.py`           | `c072582be4e27a2ca055e6cb38ed812bae9b3e690ce6e7fb415f07dd18ba4427` |

The questions a work is checked against, and the first matrices filled against them, are in
[questions](../questions/README.md).
