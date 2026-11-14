## Why

A work follows its repository's latest release. Film Kit released 0.22.0, 0.22.1 and 0.22.2 and AIGW released 0.7.2
within hours of their works' last re-pin, and the works pin v0.21.3 and v0.7.1. Film Kit's 0.22.0 changes what the
engine does: it judges an edition's assembled soundtrack before the picture follows it, measures a thought's voice
clarity as its reviewers do, and keeps a caption cue's typeset text alone. Its work describes the engine before
these, and one new file has no owner. AIGW's 0.7.2 changes what a client check says of a client's own warning and
what the JSON document of `aigw check` holds.

## What Changes

- Film Kit's work pins v0.22.2 and AIGW's v0.7.2, in both languages, with every shifted citation moved and every
  touched one reread by the re-pin worklist, and Film Kit's new file `src/filmkit/picture/slivers.py` claimed.
- Each work says what its releases add that a reader of the work would look for, and its history ends at the last
  release up to the pin that changed what the system does for its users.
- Each work's README, term table and scope name the new pin, and `CHANGELOG.md` records the moves.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check --repo` verifies every citation at the new pins, and the input check already requires a
README and term table that name each work's pinned revision.

## Impact

`publications/filmkit/` and `publications/aigw-client/`: the models, overviews, guides, READMEs and term tables;
`CHANGELOG.md`. The described repositories are unchanged. AIGW's work is re-pinned once more after its repository's
history rebuild, which keeps tag names and changes commits.
