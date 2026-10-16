# Design

## Context

This repository declares `[commit_policy] signing_required = true` and
`signing_format = "ssh"` in `.ethos/workspace.toml`, the only table there. The
ETHOS runtime that ships tasks 2.24 and 2.25 of its repository paradigm requires
an SSH signature on every governed commit and reports both fields as restated.
`openspec/config.yaml` declares no artifact rules, so it lacks the common rules
the paradigm requires.

## Goals / Non-Goals

**Goals:** remove the restated fields, add the common OpenSpec rules and move to
the runtime that requires them in one batch.

**Non-Goals:** changing publications, their inputs or tests, or the signing
setup. The repository already signs every commit with its local SSH signer and
trust anchor.

## Decisions

- Use `ethos lane repair-paradigm --apply` after exact-path prewrite admission.
  It deletes the restated fields, removes the emptied workspace binding, and adds
  the common rules while keeping the configuration's comments.

## Risks / Trade-offs

- None for behavior: the runtime already requires the signature that the removed
  fields declared.
