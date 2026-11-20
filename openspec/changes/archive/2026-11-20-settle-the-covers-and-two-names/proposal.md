## Why

The cover of an edition sets a work's title large, then its question, then its summary. On 2026-11-20 the owner
found the name said again just below it: the summaries of ETHOS, AIGW Client and Film Kit opened with the work's
name, in both languages (「首页中，仓库名称有过多重复，几个句子都以其开头」). He also found short lines spread by
justification (「部分文字描述因文字过少，两端对其导致字间距过大」): the first line of the guidelines' Chinese summary
broke before 「OpenSpec」, which cannot break, and its characters stood wide apart.

The same day a reader of the built Chinese editions could not tell apart two pairs of names. In the ETHOS work a
part is 发布标识, its detail says it makes 构建标识, and a relation into it reads 核准标识: three "identities" with no
word for how they relate. In the Architecture Publisher work a plate says 「“讲解页”调用 Archify」 where the pages
before name its output 页面, without saying that 讲解页 is the part and 页面 what it makes. The source settles both:
the runtime admits the release's build identity, and the part 讲解页 makes the page.

## What Changes

- The summaries of ETHOS, AIGW Client and Film Kit open with what the work does, in both languages, and name the
  work at most once, never first. The question keeps the name.
- The guidelines' Chinese summary turns the sentence that holds 「OpenSpec」, so the name stands inside a line.
- The ETHOS work's relation from the runtime to the release part reads 「核准构建标识」 / "admits build identity".
- The Architecture Publisher work's plate 06 says that the part 讲解页 makes the page, one panel per view, in both
  languages.
- The input check refuses a work's summary that opens with the work's name, so the rule holds for every work and
  language from now on.

No pin moves, no part, relation or view is added or removed, and no citation changes.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: a work's summary does not open with its name.

## Impact

`publications/{ethos,aigw-client,filmkit}/{en,zh}/model.json`, `publications/ddwg/zh/model.json` and
`publications/architecture-publisher/{en,zh}/model.json`: eleven values. `tools/verification/publication-inputs.mjs`
and `tests/publication-inputs.test.mjs`: the rule and its test. `CHANGELOG.md`. The five works' editions are rebuilt
for the owner.
