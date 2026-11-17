## Why

On 2026-11-17 the owner read a page of a Chinese edition on which a provider's Token was called 机密, and said that
Chinese taken word for word from English can be nonsense in its context: the works are to be written in standard,
idiomatic Chinese fit for what they speak of. A reader other than the writer then read each work's Chinese against
its English and reported 158 faults: a third were wrong terms, the rest inconsistency, word-for-word phrasing and
sentences that have to be read twice. The cause was one: each work's term table fixed a rendering for an English
word before the text was written, and every page copied it.

## What Changes

- Each work's term table gives the rendering a Chinese engineer of the field writes for the thing the word names
  in that work: 79 rows in six tables. A secret is 凭据, 令牌 or 密钥 by what it is; a fetch is 抓取; a re-pin is
  更换固定的提交.
- Each work's Chinese model follows its table: 266 strings in six models (labels, details, summaries, questions,
  limits and relation labels), and 14 printed keys of details in four works. The reasons of the excluded paths,
  which three Chinese models still gave in English, are Chinese.
- The renderings the readers questioned and the owner decided on 2026-11-18 are applied: ETHOS's Attestation is
  存证 and its proof 核验, as the ETHOS film's concept table has them; its authority is 授权; an obligation is 义务;
  `.ethos/profile.toml` is 治理配置; a checkout, as a thing, is 检出目录; Film Kit's supply step is 下载安装.
- Each work's Chinese overview composition says the corrected sentences where it places them, with its own line
  breaks: 90 lines in six files.
- No id, file, citation, number, identifier or English text changes, and no model's structure.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. The input check already requires a term table for a work in two languages and the same structure in each
language's model.

## Impact

`publications/<work>/concepts.md`, `publications/<work>/zh/model.json` and `publications/<work>/zh/overview.typ` of
the six works; `CHANGELOG.md`. The Chinese guides, and with them the page in a browser, keep their words: see the
design.
