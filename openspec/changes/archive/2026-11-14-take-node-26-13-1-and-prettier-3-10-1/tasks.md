## 1. Supply

- [x] 1.1 Declare Node 26.13.1 in `.config/mise/config.toml` and lock it again with native
      `mise lock`; done when the lock holds 26.13.1 for every platform it held 26.13.0 for and keeps
      `lockfile_version = 3`. The lock holds node 26.13.1 for the same seven platforms and no
      26.13.0 entry, keeps `lockfile_version = 3`, and every checksum equals the published sum of
      the file its URL names (six from nodejs.org's `SHASUMS256.txt`, linux-x64-musl from
      unofficial-builds').
- [x] 1.2 Move Prettier to 3.10.1 in `package.json` and resolve `package-lock.json` again; done when
      `npm ls prettier` reports 3.10.1 and the format check passes with no file changed.
      `npm ls prettier` reports 3.10.1; the npm lock changed only Prettier's version, resolution and
      integrity; the format check passes and reformats no file.
- [x] 1.3 Record both moves in the Changelog; done when `mise run check` passes. The Unreleased
      Changed list names Node 26.13.1 and Prettier 3.10.1; `mise run check` passes with 14 tests,
      and the format check and the `markdown-lint`, `prose`, `openspec`, `config-quality` and
      `docs-registry` gates pass.
