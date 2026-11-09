## 1. Works

- [x] 1.1 Write a summary for each of the 41 views in English and in Chinese from what its model says; verify `archpub check --repo` with Architecture Publisher 0.10.2 passes all twelve models. Architecture Publisher 0.10.2 `check --repo` passes all twelve models, each view with its summary.
- [x] 1.2 Re-pin the OpenAI Responses Proxy work to v5.1.10 from its worklist, with its new files claimed and its touched citations and uncited facts read against the release; verify the same check owns every file of its scope in both languages. The same check owns all 85 files of its scope in both languages; 28 touched citations moved, none changed its claim, and the input-length recovery was added.
- [x] 1.3 Re-pin the Architecture Publisher work to v0.10.2 and correct what its guide says about a reading too tall for the body; verify the same check owns every file of its scope in both languages. The same check owns all 64 files of its scope in both languages, and the guide cites `src/overview/house.typ` for a reading too tall for the body.

## 2. Inputs

- [x] 2.1 Make the input check refuse a view without a summary, state the rule in the input specification, name 0.10.2 in the README and record the changes in the changelog; verify `npm run check`. `mise run check` passes, with the new test refusing a view whose summary is missing, blank or not text.

## 3. Verification

- [x] 3.1 Build the six works in both languages with Architecture Publisher 0.10.2 from the committed bytes; verify each delivers its edition and its page. Architecture Publisher 0.10.2 builds all twelve models from these bytes, each with its edition and its page.
