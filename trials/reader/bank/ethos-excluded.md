# ETHOS: archived Changes that are not items

Pin `999784081fa3de9a97879ac17862f425b8120437` (`v0.2.0-beta.9`), `dev` at
`23538df6b591b54c990d2d60f0076a0044377f53`. 24 Changes were archived after the pin; 13 are items, 6
are excluded by class and 5 are dropped. This file holds answer paths; never show it to a subject.

## Excluded by class

| Change                              | Commits (first..archive) | Class              | Reason                                                                                                                             |
| ----------------------------------- | ------------------------ | ------------------ | ---------------------------------------------------------------------------------------------------------------------------------- |
| `2026-11-12-product-form-plan`      | `f5bedcebd..f9852cee9`   | Plan-only          | Edits one page under `docs/plans/`.                                                                                                |
| `2026-11-12-security-policy`        | `d4c67f19f..6f84a76ff`   | Documentation-only | Adds `SECURITY.md` and a `CHANGELOG.md` line.                                                                                      |
| `2026-11-12-openspec-archive-prune` | `5f385190d..9b17f2986`   | Documentation-only | Deletes archived Change directories; the only path left outside `openspec/changes/` is the canonical spec that the archive merged. |
| `2026-11-13-supply-move-1113`       | `ac1710fdc..82fc6a8b0`   | Supply move        | Node.js, the Python lock, the CI supply image and its binding.                                                                     |
| `2026-11-13-beta-10-release`        | `3c64a9ec7..b10254f87`   | Release            | `VERSION` and `CHANGELOG.md` for 0.2.0-beta.10.                                                                                    |
| `2026-11-13-common-base-plan`       | `8f01ba417..a52bffd2b`   | Plan-only          | Pages under `docs/plans/` and `docs/research/`.                                                                                    |

## Dropped: follow-up to a Change made after the pin

Each of these changed product source or tests, so the brief's class rule would make it eligible. It
is dropped because the problem it states does not exist at the pin: an earlier Change after the pin
created it. A subject at the pin cannot find the defect, and for three of the five some or all of
the files do not exist there. The commit ranges are delimited with confidence, so any of them can be
reinstated if the experiment admits such items.

| Change                                    | Commits (first..archive) | Depends on                                                                                       | Paths outside the exclusions                                                                                                                                                                                                                                                                                                                                        |
| ----------------------------------------- | ------------------------ | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `2026-11-12-toolchain-lock-density`       | `e3b70d646..c2c86bf70`   | `toolchain-lock-scope` raised one function past the decision-density threshold                   | `src/ethos/repository/paradigm/toolchain.py`, `tests/fixtures/decision-density-baseline.json`                                                                                                                                                                                                                                                                       |
| `2026-11-12-product-budget-step-85`       | `7b562d098..f266a82f0`   | The three layout rules pushed the product over its line budget; it merges the files they created | `.config/checks/format-selection/policy.toml`, `docs/decisions/README.md`, `docs/decisions/dr-0025-product-budget-step-85.md`, `src/ethos/adapters/store/custody.py`, `src/ethos/adapters/repo/hook/admission.py`, `src/ethos/adapters/repo/hook/staged_markdown.py` (deleted), `src/ethos/adapters/repo/hook/staged_text.py`; the last two do not exist at the pin |
| `2026-11-12-canonical-text-test-dedup`    | `679ff0a5e..7912c4b84`   | `text-layout-rule` added a test with a duplicated helper                                         | `tests/unit/adapters/gates/test_source_format_canonical_text.py`, which does not exist at the pin                                                                                                                                                                                                                                                                   |
| `2026-11-12-proof-sample-docstring`       | `3e27dfc9d..cfc6bc479`   | `package-docstring-rule` made a test's sample package fail the proof                             | `tests/unit/cli/test_proof_execution_source.py`                                                                                                                                                                                                                                                                                                                     |
| `2026-11-13-staged-text-installed-policy` | `514136415..aa9f85d51`   | `text-layout-rule` added the staged text check that misread the policy                           | `src/ethos/adapters/repo/hook/staged_text.py`, `tests/unit/adapters/repo/hook/test_staged_text.py`; neither exists at the pin                                                                                                                                                                                                                                       |

No Change was dropped for an empty answer or for more than 40 answer paths.
