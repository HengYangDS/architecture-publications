## Why

A work follows its repository's latest release. On 2026-11-16 AIGW released 0.8.1, and its work pins v0.8.0. The
release changes when a command asks the credential store: once for a provider's Token and once for its balance
credentials, and again only after the command stores or removes that credential itself. It corrects two faults:
`aigw use` now says that an entered Token was not kept when its selection fails after storing it, also with the
credential backend AIGW selects by default; and a build from a checkout without a Git remote completes. Eleven of
the files the work owns or cites changed, 32 of its 126 citations shifted, and none stands on changed lines.

## What Changes

- The work pins v0.8.1 in both languages, with every shifted citation moved.
- What the work says of the commands, of the credentials and of the domain agrees with 0.8.1, where the release
  changed a fact the work states.
- The work's history ends at 0.8.1, and its README, term table and scope name the new pin. `CHANGELOG.md` records
  the move.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pin, and the input check already requires a README
and term table that name the work's pinned revision.

## Impact

`publications/aigw-client/`: the models, overviews, guides, READMEs and term tables; `CHANGELOG.md`. The described
repository is unchanged.
