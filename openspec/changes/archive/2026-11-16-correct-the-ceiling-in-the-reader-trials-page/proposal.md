## Why

`trials/reader/pages/ethos.md`, the page of constraints that arm D of the reader experiment gave its readers, says
that each code file of ETHOS is limited to 512 ELOC, citing lines 59 to 60 of ETHOS's decision record DR-0010 at
the experiment's pin. The citation is faithful and the number is stale: at the same pin ETHOS's DR-0019 says that
DR-0010's "512-ELOC per-file limit" was stale when it was written and that the per-file ceiling is 500 lines. The
owner said on 2026-11-16: 「所有 eloc 上限都是 500。512 是需要修复的历史残留」, and, asked whether the page should
stay as the experiment's material with a correction in the record only: 「都改成 500」.

## What Changes

- The page states the ceiling as 500 lines and cites the line of DR-0019 that states it at the experiment's pin.
- The record of the experiment says that the page was corrected after the runs, quotes the line the readers were
  given, and says that no item asks for the ceiling, so no score changes.
- `CHANGELOG.md` records the correction.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None.

## Impact

`trials/reader/pages/ethos.md`, `trials/reader/2026-11-15-record.md`, `CHANGELOG.md`. No work and no outcome of the
experiment changes. ETHOS's DR-0010 is ETHOS's to correct.
