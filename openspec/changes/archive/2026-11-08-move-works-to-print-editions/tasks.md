## 1. Works

- [x] 1.1 Migrate the six works to model version 3 with their editor, licence and browse template; verify `archpub check --repo` with Architecture Publisher 0.10.0 passes each. Each model reads as version 3 with Yang HENG as its editor, MIT and its repository's browse template. Architecture Publisher 0.10.0 checks AIGW (208 files owned of 208), DDWG (48 files owned of 48) and OpenAI Responses Proxy (80 files owned of 80) at their unchanged pins, and the three re-pinned works below.
- [x] 1.2 Re-pin the ETHOS work to v0.2.0-beta.6 from its worklist, with its new files claimed, its touched citations read again and its proof timeline measured again; verify the same check owns every file of its scope. At `727ee05` the check owns all 467 files of the scope and admits the 11 views; four new files are claimed, eight relations cite the modules that now make them, one cites one module fewer, and the proof waterfall is rebuilt from the beta.6 proof of `df08239`, dated 2026-11-08.
- [x] 1.3 Re-pin the filmkit work to v0.16.0 from its worklists, with its new files claimed and its touched citations, counts and statements read against the release; verify the same check owns every file of its scope. At `d6de895` the check owns all 110 files of the scope, 325 excluded, admits the 6 views and verifies the guide at showcase with strict writing; the ten new files are claimed, and the guide states the four films, 25 delivery members, picture equivalence, pause limits, declared terms and the stage-cut refusal.
- [x] 1.4 Re-pin the Architecture Publisher work to v0.10.0, with the edition's component, view and workflow in place of the posters and the rasterizer; verify the same check owns every file of its scope. At `548637c` the check owns all 64 files of the scope, admits the 6 views and verifies the guide at showcase with strict writing; the raster component is gone, `src/edition/` has its component, and the edition's view and workflow replace the posters.

## 2. Inputs

- [x] 2.1 Make the input check read model version 3, and describe the print edition in the README and the input specification; verify `npm run check`. The check reads `version` 3 and its test refuses version 2; the README and the spec delta name the edition's plates; `mise run check` passes formatting and 8 of 8 tests at `3103a75`.

## 3. Verification

- [x] 3.1 Build the six works with Architecture Publisher 0.10.0 from the committed bytes; verify each delivers its edition and its page. Architecture Publisher 0.10.0 builds each work from `3103a75`: its edition and its page, with 6 plates each and 11 for ETHOS.
