## Constraints

- Never alter Codex JSONL, SQLite, archived conversations, model metadata or a local proxy deployment to make a
  configuration test pass (AGENTS.md 43-45).
- Accounts, Routes, recommendations and Client Bindings form the configuration SSOT
  (`docs/decisions/dr-0004-account-route-client-binding-authority.md` 32-33).
- Normal runtime accepts only the current schema; the preceding schema is readable only by the explicit
  configuration migration command (`docs/decisions/dr-0004-account-route-client-binding-authority.md` 43-45).
- Account Tokens never appear in public configuration, logs, arguments, manifests or backups
  (docs/governance/adapter-admission.md 137-139).
- Each installation selects one Account Token backend; explicit `keyring`, `file` and read-only `env` selections
  never fall through to another backend (`docs/decisions/dr-0011-single-portable-token-backend.md` 25-34).
- Every multi-file mutation validates the desired state, captures preimages, prepares all writes first, checks
  each preimage and compensates only unchanged owned postimages (docs/architecture/security-model.md 177-185).
- `aigw sync --dry-run --json` is credential-free planning: no lock, session edit, client restart or projection
  write (CONTRIBUTING.md 119-120).
- A missing client is a successful no-op, not an invitation to create placeholder state
  (docs/governance/adapter-admission.md 160-161).
- An Anthropic probe sets `X-Api-Key` and not `Authorization`; an OpenAI Responses probe sets a Bearer
  `Authorization` and not `X-Api-Key`; tests assert both (docs/governance/adapter-admission.md 163-167).
- Packages form one layer stack enforced by `tools/architecture`; a production file imports only its descendants,
  lower layers and declared seams (docs/architecture/authority-and-projection-boundary.md 63-68).
- `internal/domain` imports only the standard library, adapters never import each other, and no two production
  packages share a base name (.config/checks/architecture/policy.toml 75-76, 142-146, 177-179).
- Go statement coverage must be strictly greater than 95% in aggregate, every package is observed, and no package
  or source exclusion is permitted (.config/checks/coverage/policy.toml 6-9; AGENTS.md 80-83).
- SCC's code-line budget is 500, shared by product, tools, tests and platform variants, and a main specification
  may have at most 500 lines (.config/checks/scc/policy.toml 1-9).
- Retained lint limits are Cyclop 25, cognitive 45, span 120/statements 60, arguments 7 and clones 100 tokens;
  never evade them with forwarding helpers, parameter bags or exclusions
  (docs/governance/change-and-release-policy.md 446-448, 456-464).
- Tracked text is UTF-8 with LF endings, a final newline and no trailing whitespace; locked Prettier uses a
  100-column width (docs/governance/text-layout.md 33-35, 89-91).
- OpenSpec findings block admission at every severity, including INFO
  (docs/governance/change-and-release-policy.md 375-377).
- JSON output is one UTF-8 document with two-space indentation and a trailing newline; credential-helper stdout
  carries only the requested credential (docs/experience/terminal-experience.md 60-63, 83-84).
- Release-review budgets are p95 ≤100 ms for warm version/help/status/export and projected helpers, and p95
  ≤250 ms for a binding change, first setup or sync (docs/governance/change-and-release-policy.md 529-538).
- Updates never combine a tag, checksum or asset across peers and authenticate `checksums.txt.sig` against the
  embedded release key before hashing, extracting or executing downloads (README.md 349-354).
- `## [Unreleased]` holds only changes after the latest published tag; older headings require their exact signed
  tag and date (CONTRIBUTING.md 476-479).

## Processes

- Before a tracked edit, run `ethos status --json`, load the Skill it names, and obtain a passing current
  `ethos lane prewrite` for the exact worktree and paths (AGENTS.md 11-16).
- Select the OpenSpec requirement and owner, confirm a regression's RED, make the smallest complete repair, run
  focused GREEN, then `mise run check`, and verify the signed commit range (CONTRIBUTING.md 70-74).
- Run `mise install --locked`, `mise run bootstrap`, `mise run check` (`tools/ci source`) and `mise run native`
  (`tools/ci native`) in that order (AGENTS.md 115-120; .config/mise/config.toml 91-97).
- `mise run native` runs source tests in one coverage invocation, builds host archives through GoReleaser and
  exercises install, upgrade, invalid-successor rejection, rollback and uninstall without publishing
  (CONTRIBUTING.md 272-276).
- `go run ./tools/forge commits --base --revision` verifies every introduced commit against the allowed-signers
  file; it proves objects, not CI success or permission to publish (docs/operations/forge-operations.md 82-99).
- One OpenSpec Change owns intent and tasks; finish implementation, archive through OpenSpec before stable
  tagging, then re-qualify the final signed source (docs/governance/change-and-release-policy.md 143-152).
- Reviews into `dev`/`main` and every `dev`/`main` push get complete source verification; release tags add
  signed-source and native-platform checks (`docs/decisions/dr-0010-lifecycle-scoped-ci-evidence.md` 31-37).
- `mise run release` requires clean source and `AIGW_RELEASE_SIGNING_KEY`; verify `checksums.txt.sig` with
  `ssh-keygen -Y verify`, then `go run ./tools/release validate-artifacts` (CONTRIBUTING.md 408-433).
- Before tagging, `go run ./tools/release accept-native --candidate --clients` admits the signed candidate
  against a published predecessor matrix (CONTRIBUTING.md 317-323).
- Stable publication entrypoints require `verify-macos-distribution` after Apple accepts notarization, before
  any Forge access (docs/governance/change-and-release-policy.md 287-300).
- Create and sign the annotated tag once locally, then publish it to each peer with `tools/forge publish-tag`;
  a different remote object fails closed (docs/operations/forge-operations.md 222-239).
- After complete uploads, dispatch each peer's Release on the exact tag; its `release-assets` job reruns the
  complete signature, source and provenance verifier (CONTRIBUTING.md 467-472).
- A configuration commit captures preimages, preflights every client, persists configuration, then applies
  projections, compensating on failure (docs/architecture/authority-and-projection-boundary.md 350-358).
- Program rollback first proves the retained program reads an isolated copy of current configuration; rejection
  preserves programs and configuration (docs/governance/change-and-release-policy.md 174-178).

## Decisions

- Decision Records preserve durable rationale after an OpenSpec Change closes, as `dr-NNNN-description.md` with
  never-reused sequences and fixed sections (docs/decisions/README.md 11-30).
- DR-0001 separates configuration control from transport, rejecting a mandatory all-in-one gateway, a client
  switcher as canonical store and provider-specific code per compatible endpoint
  (`docs/decisions/dr-0001-control-plane-data-plane-boundary.md` 24-44).
- DR-0004 chose Account, Model, Route and Client Binding, rejecting client identity in every Route and separate
  Route and Adapter selections (`docs/decisions/dr-0004-account-route-client-binding-authority.md` 23-52).
- DR-0005 requires one explicit Adapter admission with real evidence per client, rejecting admission by protocol
  compatibility, generic discovery or provider support
  (`docs/decisions/dr-0005-admitted-client-adapter-boundary.md` 36-71).
- DR-0006 prepares every target before writing and compensates only matching postimages, rejecting sequential
  best-effort writes and unconditional rollback (`docs/decisions/dr-0006-transactional-client-projection.md` 21-37).
- DR-0003 renames an Account in two phases, copy then delete, because deleting old slots at once risks lost
  access (`docs/decisions/dr-0003-account-rename-credential-migration.md` 29-57).
- DR-0007 makes local Git the sole product-object authority, signed once and published unchanged, rejecting
  Forge identity replay and parity via qualified tags, commit maps or tree comparison
  (`docs/decisions/dr-0007-local-first-independent-forge-release.md` 25-50).
- DR-0009 forbids shims, re-exports, alias-only packages, forwarding facades and silent legacy readers, so old
  shapes are removed directly (`docs/decisions/dr-0009-forward-only-current-product-semantics.md` 24-31).
- DR-0010 has hosted release jobs verify rather than construct: one approved host signs one matrix, keeping
  private signing keys off runners (`docs/decisions/dr-0010-lifecycle-scoped-ci-evidence.md` 51-56).
- DR-0011 selects one Token backend per installation, rejecting searching both stores, an independent host-local
  helper (rolled back), silent migration and package-manager credential paths
  (`docs/decisions/dr-0011-single-portable-token-backend.md` 43-53).
- Lint limits were calibrated on three platforms, keeping Cyclop 25 over trials of 20 and 15; reopen only for a
  concrete escaped risk or semantic redesign (docs/governance/change-and-release-policy.md 453-471).
- Renovate is the single proposal policy, as Dependabot cannot cover the mise graph; no Pants, Dagger, Nix or CEL
  plane is admitted without demonstrated benefit (docs/governance/change-and-release-policy.md 52-59, 373-375).
- Authority runs current user instruction, then code, tests, schemas and CI, then `docs/`, then marked
  projections, then caches and logs (AGENTS.md 35-41).
