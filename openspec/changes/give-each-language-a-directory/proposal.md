## Why

The two languages of every work are laid out unequally. A work keeps its English model, overview and guide at its
root and its Chinese ones in `zh-CN/`, and only the Chinese side holds the term table, so one language reads as the
work and the other as its appendix. The owner ruled on 9 November that in every multilingual repository each
language's directory has the same structure, named by its lowercase language code alone: `en/` and `zh/`.

## What Changes

- Each work holds `en/` and `zh/`, each with its model, overview and guide at the same paths. The work's README,
  custody record and `concepts.md`, the table of term renderings across its languages, stay beside them.
- Each English model names its locale, `en`, as each Chinese model names `zh-CN`.
- The input check requires each language in a directory named by its model's language, the same files in every
  language, one id and revision across them, and `concepts.md` in a work of more than one language. It refuses a
  model at the work's root.
- The README, the contributor guide and the `[0.1.0]` changelog entry, which has no tag yet, describe the layout.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: a work holds each of its languages in a directory of its own, with the same files in each.

## Impact

`publications/**`, moved with `git mv` apart from one `locale` line per English model and the paths named in four
term tables; `tools/verification/publication-inputs.mjs` and its test; `README.md`, `CONTRIBUTING.md` and
`CHANGELOG.md`. Each language's edition and page is built from its own directory:
`archpub build publications/<work>/<language>/model.json`. The editions' figures do not change; the English
editions attach a model that now names its locale.
