## 1. Inputs

- [x] 1.1 Admit a translation directory in the input check and refuse one whose model names another locale, id or revision, or that holds no term table; verify the new tests fail first and then pass with `npm run check`. The check admits `zh-CN/` and refuses another locale, id or revision, an extra file or a missing `concepts.md`; the new test failed on the old check, and `mise run check` passes formatting and 9 of 9 tests at `3bd2631`.
- [x] 1.2 Describe translations in the README and the input specification. The README describes the translations and the input checks, and the spec delta adds the requirement with three scenarios.

## 2. Works

- [x] 2.1 Correct the filmkit balance citation and the AIGW credential helper, and move the Architecture Publisher work to v0.10.1; verify `archpub check --repo` with Architecture Publisher 0.10.1 passes the three works. At `3bd2631` Architecture Publisher 0.10.1 checks filmkit (110 of 110 files), AIGW (208 of 208) and Architecture Publisher at `1861b7c` (64 of 64), each guide strict and verified.
- [x] 2.2 Add each work's Chinese translation in `zh-CN/`; verify `archpub check --repo` with Architecture Publisher 0.10.1 passes all six translations. At `3bd2631` Architecture Publisher 0.10.1 checks all six translations: ETHOS 467 of 467 files and 11 views, filmkit 110, Architecture Publisher 64, AIGW 208, DDWG 48 and OpenAI Responses Proxy 80, each with 6 views, every guide strict and verified.
