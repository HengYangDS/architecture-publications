## Why

A work follows its repository's latest release. AIGW released 0.8.2 on 2026-11-18 and its work pins v0.8.1.

0.8.2 changes what AIGW does at places the work describes. A model whose ID adds to its family's ID derives a
label with the rest of its ID, and a configuration or a team file in which two models of one provider have one
label is refused, a breaking change. The team file follows GPT-6.2 and chooses models per provider. Codex's catalog
alias shows the model's AIGW label, and the catalog verifier refuses an alias two entries share. Hermes's
configuration is read and written through another YAML library, which keeps a literal block and no longer changes
the value of a folded one. 16 of the 241 files in the work's scope changed; 33 citations stand on lines that moved
and none on lines that changed.

## What Changes

- The AIGW Client work pins v0.8.2 in both languages, with every shifted citation moved.
- What the work says agrees with the release where the work speaks of what the release changed: the six parts and
  ten relations that own a changed file are reread against the diff of their files.
- The work's history takes 0.8.2, and its README, term table and scope name the new pin. `CHANGELOG.md` records the
  move.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pin, and the input check already requires a README
and term table that name the work's pinned revision.

## Impact

`publications/aigw-client/`: the models, the guides with their diagram files, the README and the term table;
`CHANGELOG.md`. The described repository is unchanged.
