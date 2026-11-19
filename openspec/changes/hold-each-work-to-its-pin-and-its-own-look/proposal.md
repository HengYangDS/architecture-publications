## Why

The owner read the twelve deliveries of 2026-11-19 and named three things a work said or lacked that he had ruled
on before:

- A work describes its repository at its pin, and two works carried a measurement made under an older version.
  The ETHOS work pins v0.2.0-beta.10 and its page's figure of one full proof was measured on 2026-11-08 under
  v0.2.0-beta.6. The publisher's own work pins v0.15.0 and its table of what a move of the pin lists was counted
  on 2026-11-08, when the work moved from v0.9.0 to v0.10.0.
- On 2026-11-13 he said that each work chooses a palette. The product has offered four and an author's own since
  0.13.0; no work names one, so all twelve editions are drawn in the default.
- On 2026-11-12 he gave his Chinese name. The Chinese editions name their editor in Latin letters.

## What Changes

- The ETHOS work's figure of one full proof holds the gate records of a proof run by v0.2.0-beta.10 on 2026-11-19,
  and the three sentences that quote it hold its numbers.
- The publisher's own work's table holds the worklist of its move from v0.14.0 to v0.15.0, with the sentence under
  it.
- Each work names a palette in both languages. ETHOS keeps Indigo and says so; the others take Soot, Persimmon,
  Patina and the two palettes the model reference gives as examples of an author's own.
- The six Chinese models name their editor 衡阳.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. `archpub check` verifies every citation and refuses a palette that does not print well; the input check
already holds a work's languages to one shape.

## Impact

`publications/*/{en,zh}/model.json`; `publications/ethos/{en,zh}/guide/` (the guide and one diagram file) and
`publications/ethos/README.md`; `publications/architecture-publisher/{en,zh}/guide/guide.archify.md` and its
README; `CHANGELOG.md`. No described repository changes.
