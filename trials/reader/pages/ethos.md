## Constraints

- Only `Attestation` persists; `Commitment` is transient intent compiled from official OpenSpec, and Facts and
  TransitionPlan are transient too (README.md 104-105).
- Official OpenSpec Changes are the sole tracked intent, design, spec, task-progress and archive carrier;
  Commitment holds only `schema_version`, `id`, `acceptance` (docs/governance/product-design-contract.md 105-122).
- Mutation authorization is the closed union `pass | block | unknown` and only `verdict=pass` authorizes an
  effect; missing facts yield `unknown`, conflicts and failures yield `block` (rules/mutation.md 18).
- Before changing tracked files, obtain a passing `ethos lane prewrite` decision for the exact root and paths;
  no prose, host state, projection or visible Work Lane grants mutation authority (AGENTS.md 13-15).
- Normal tracked writes belong only in an owned `work/*` Work Lane; `accepted_root` and `candidate` checkouts
  are observe-only (rules/mutation.md 19-20).
- Every mutation observes fresh HEAD, tree, index, worktree and ref facts, rechecks them at effect time, applies
  one compare-and-swap, then post-observes and attests (rules/mutation.md 33-35).
- ETHOS protects only accepted `dev` and release `main`; adopters may rename refs but preserve the roles
  (docs/governance/product-design-contract.md 261-263).
- Every commit carries an SSH signature verified against a repository-external trust anchor, and its subject is
  `<type>: <description>` or `<type>(<scope>): <description>` with a listed type (CONTRIBUTING.md 24-46).
- Commit and tag messages must not name a private-class network address (RFC 1918/4193 literals or hosts under
  `.local`, `.internal`, `.lan` or `.home.arpa`); admission refuses them (CONTRIBUTING.md 64-69).
- Imports follow surface → application → domain → adapters → repository under import-linter, and the lists of
  remaining forbidden direct imports only shrink (rules/module-layout.md 183-187).
- Imports are absolute and one per line, package `__init__.py` files stay declaration-only, and re-export
  barrels, facades, alias shims and identity-forward functions are forbidden (rules/module-layout.md 157-176).
- `core.py`, `common.py`, `shared.py`, `utils.py`, `helpers.py`, `misc.py`, `base.py`, `manager.py` and
  `service.py` are blocked module names (rules/module-layout.md 46-49).
- Python ceilings are 80,000 product, 105,000 test and 10,000 tool line-equivalents, with `line_width` 100
  (.config/checks/format-selection/policy.toml 7-12).
- Each code file is limited to 512 ELOC (docs/decisions/dr-0010-source-budget-non-compensation.md 59-60).
- Combined Python line-and-branch coverage is at least 95 percent over the declared product surface, and debt
  fails (docs/governance/product-design-contract.md 480-483).
- `openspec/changes/archive/` is an immutable record root and archived OpenSpec YAML has mutation policy
  `forbidden` (.config/checks/format-selection/policy.toml 11, 65-75).
- JSON results use schema version `3`, where `verdict` alone decides authorization, and fit 16 KiB (32 KiB for
  `plan`, 48 KiB for `help`) (docs/reference/command-plane.md 396-397, 423).
- A request selecting no operation exits 2, a preview exits 0, an apply, proof or publication probe exits 1
  unless it passes, and an undelivered result exits 3 (docs/reference/command-plane.md 59-61).
- The product version lives only in `VERSION`; no lock records it (docs/guides/release-and-publication.md 19).
- Once a release identity is accepted, changed released semantics require a greater version
  (openspec/specs/distribution/spec.md 250-254).

## Processes

- Work starts with `ethos status --json` in the target worktree, then follows its one continuation and loads
  only the rule or skill it selects before planning mutation (README.md 85-87).
- The kernel compiles `(Commitment, Facts, prior Attestations)` into a TransitionPlan, then freshly admits
  exact CAS effects, post-observes and attests them (docs/governance/product-design-contract.md 181-183).
- Standard verification reproduces the violated invariant, runs every test consumer of the changed modules
  and cheap checks, freezes all source input, then executes the exact-HEAD proof once (CONTRIBUTING.md 101-113).
- Routine fast iteration reuses the owned Work Lane and active Change, runs the formatter and directly affected
  tests, and requests exact-source proof only at the acceptance boundary (CONTRIBUTING.md 124-131).
- There is no automatic risk-selected small-change acceptance or `--fast` option (CONTRIBUTING.md 86-87).
- The standard route is `status`, `lane prewrite … --require-editor-root`, `plan --changed`,
  `prove --full --execute --expect-head <head>`, then `land` (docs/reference/command-plane.md 517-523).
- `ethos prove --host --execute --gate <id>` gives working-tree feedback but issues no proof Attestation and
  grants no tracked-write or landing authority (docs/reference/command-plane.md 537-543).
- Full proof runs readiness gates first and stops if one fails, then holds the repository and host slots and
  waits up to one hour for acceptable load before test and package gates (docs/reference/command-plane.md 449).
- Local development runs `tests/unit` under pytest with `.config/checks/pytest/pytest.toml`, the
  `unit-architecture` proof gate and the `nox -s lint` session through `uv run` (README.md 147-153).
- A settled Change archives with `ethos lane archive-change --change <id> --expect-head <head>`, whose guarded
  continuation proves the archived head; if that proof fails, `--compensate` returns it to the pre-archive head
  (docs/reference/command-plane.md 464-470).
- A Change's tasks never mark its own landing, archive or Lane retirement complete (openspec/config.yaml 39-41).
- A release Change moves `VERSION` and curates `CHANGELOG.md`, then archives, proves the archived head, lands,
  publishes `dev` then `main`, tags with `ethos land --release … --tag`, and dispatches hosted `ETHOS CI`
  (docs/guides/release-and-publication.md 19-23).
- Remote publication uses the exact locally created, signed commit or annotated tag with live peer-local exact
  CAS, and reports partial peer effects instead of cross-peer atomicity (rules/release.md 25-29).
- Break-glass needs an exact scope, explicit reason, the maintainer's non-interactive authority, a receipt and
  post-effect observation and re-entry; an agent never authorizes its own bypass (CONTRIBUTING.md 140-147).
- A temporary hook bypass needs explicit human authorization, uses command-scoped `git -c core.hooksPath=…`,
  keeps signing, and never counts a skipped hook as pass (docs/reference/command-plane.md 565-580).
- After a detected protected-root mutation, only rollback, migration to a Work Lane, recovery evidence or
  violation reporting may run until the root is clean (rules/mutation.md 51-56).

## Decisions

- ETHOS governs itself and adopted repositories through one kernel; they differ by profiles and adapters, not
  by separate command planes or private truth stores (README.md 33-38).
- ETHOS is one cohesive Python product package whose internal module boundaries protect meaning; a second
  distribution package is not needed to express them (README.md 112-117).
- Git, forges, CI, OpenSpec and agent runtimes remain native systems or adapters; none becomes an ETHOS-owned
  truth store merely by being connected (docs/governance/product-design-contract.md 38-40).
- A new carrier, schema, record or state needs an obligation absent from existing owners, an invariant that its
  deletion would make unprovable, and one bounded owner (docs/governance/product-design-contract.md 347-357).
- Conflicts go through Model Promotion of the smallest affected boundary, never an exception, alias, fallback,
  shim or parallel truth (docs/governance/product-design-contract.md 195-202).
- DR-0006 keeps local proof and independent assurance as separate planes, rejecting same-principal signatures,
  mandatory hosted verification and a bundled daemon (docs/decisions/dr-0006-proof-trust-boundary.md 39-56).
- DR-0010 makes source budgets non-compensating and lets a ceiling rise only by one reviewed 5,000-ELOC step,
  rejecting one aggregate budget, raw LOC, a private metric runtime and threshold-driven splits
  (docs/decisions/dr-0010-source-budget-non-compensation.md 47-71).
- DR-0012 imposes one repository paradigm with no per-repository exceptions, rejecting per-repository
  conventions, a cloned tree, concern-named config and unenforced documentation
  (docs/decisions/dr-0012-repository-paradigm.md 40-65).
- DR-0017 gives each obligation one owner, rejecting repository-kind profiles, code-similarity sinking, starter
  templates and an exemption letting ETHOS judge itself by its own committed policy
  (docs/decisions/dr-0017-one-obligation-one-owner.md 45-69).
- DR-0022 makes builds immutable from 0.3.0 with `beta`, `rc` and `stable` as evidence-gated channel pointers,
  after a hosted macOS outage stalled the line (docs/decisions/dr-0022-release-channels-0-3-0.md 27-51).
- DR-0018 judges a historical artifact by the attestation made when it was produced, never re-judging it under
  a later runtime's policy (docs/decisions/README.md 44).
- Decision records named `dr-<four-digit-id>-<semantic-topic>.md` never reuse numbers and keep rationale, not
  executable authority; Git keeps the bytes of non-current records (docs/decisions/README.md 11-25).
- Before archive, a design's durable cross-Change rulings move to the Product Design Contract, the terminal plan
  or a decision record (openspec/config.yaml 76-78).
- Repeated late failures move to the earliest enforceable boundary, and a policy is strengthened in one owner
  rather than duplicated across surfaces (rules/README.md 46-55).
