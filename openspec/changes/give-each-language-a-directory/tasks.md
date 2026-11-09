## 1. Layout

- [ ] 1.1 Write failing tests for the language layout: a work in `en/` and `zh/` passes; a directory not named by its model's language, languages that hold different files, a language that lags another, two languages without `concepts.md` and a model at the work's root are refused; verify they fail on the current check.
- [ ] 1.2 Check the layout in `tools/verification/publication-inputs.mjs`; verify the new tests pass.
- [ ] 1.3 Move each work's English files to `en/`, `zh-CN/` to `zh/` and `concepts.md` to the work's root with `git mv`, name `en` in each English model, and describe the layout in the README, the contributor guide, the term tables and the `[0.1.0]` changelog entry; verify `mise run check` passes and Vale reports nothing in the changed Markdown.

## 2. Acceptance

- [ ] 2.1 Build the twelve editions and pages with released Architecture Publisher 0.10.2 from the lane; verify every build passes, every plate and overview image matches the build of `35ad28a`, and every Chinese edition is byte-identical to it.
