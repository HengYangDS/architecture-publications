## Why

A work follows its repository's latest release. On 2026-11-15 AIGW released 0.8.0, and its work pins v0.7.2. The
release is breaking. On macOS AIGW no longer takes over a Keychain item that 0.3.5 or earlier stored, no command
migrates a Keychain item, and `aigw self rollback` moves no credential and is refused on a Homebrew installation.
Four files that the work's relations list are gone at the tag, so the model names files that no longer exist, and
what the work says of a program rollback and of stored credentials has to be read against the release.

## What Changes

- The work pins v0.8.0 in both languages, with every shifted citation moved and every component and relation of
  the re-pin worklist reread.
- The four deleted files leave the relations that list them.
- What the work says of `aigw self rollback`, of a Keychain item another program stored and of an empty Token is
  what 0.8.0 does.
- The work's history ends at 0.8.0, and its README, term table and scope name the new pin. `CHANGELOG.md` records
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
