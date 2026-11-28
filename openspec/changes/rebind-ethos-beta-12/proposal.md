## Why

ETHOS released 0.2.0-beta.12 on 2026-11-28, and this repository still runs 0.2.0-beta.11. A governed repository takes a
new ETHOS release once it is published and read back; the owner exempted ETHOS's own releases from the 24-hour wait
that third-party supply keeps (relayed by the session building ETHOS, 2026-11-28). The owner also wants no
ETHOS-governed repository to support Windows, with nothing of it left: this repository still declares ETHOS for two
Windows platforms, and its lock holds Windows, musl and Intel macOS entries.

## What Changes

- `.config/mise/config.toml` declares ETHOS 0.2.0-beta.12 for linux-arm64, linux-x64 and macos-arm64, and limits the
  lock's platforms to those three.
- `.config/mise/mise.lock` is written again by native `mise lock`: ETHOS and Node for the three platforms only.
- The repository family's hook runtime becomes 0.2.0-beta.12, with 0.2.0-beta.11 as its rollback.
- `openspec/config.yaml` loses the example line that names Windows.
- The Changelog records the move under Changed.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None.

## Impact

Changed: `.config/mise/config.toml`, `.config/mise/mise.lock`, `openspec/config.yaml` and `CHANGELOG.md`. No work,
test or tool.

Queue: `maintenance`.
