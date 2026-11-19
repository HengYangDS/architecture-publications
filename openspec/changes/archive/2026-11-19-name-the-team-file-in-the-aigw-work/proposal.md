## Why

The owner read the AIGW Client edition and asked which file it meant, `aigw.toml` or `team.toml`. They are two
files of the product at its pin, v0.8.2: the configuration AIGW keeps under a lock in the operator's home, and the
team file a team reviews and distributes, tracked as `manifests/team.toml` and applied with
`aigw setup --from team.toml`. The edition names the first by its file three times and the second only as "the team
file", so a reader who knows the file's name does not find it.

## What Changes

- The work's scope names the tracked team file, `manifests/team.toml`, in both languages.
- The overview's block on team files gives the command as the product's README gives it,
  `setup --from team.toml`, in both languages.

No other sentence changes. The Chinese gains a file's name and no word.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None.

## Impact

`publications/aigw-client/zh/model.json`, `publications/aigw-client/en/model.json` and `CHANGELOG.md`. The edition's
contents page and its overview page change by those words; no citation and no pin changes.
