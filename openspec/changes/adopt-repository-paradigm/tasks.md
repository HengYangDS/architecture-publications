# Tasks

## 1. Runtime

- [x] 1.1 Switch the repository's hooks to the current ETHOS runtime with `hook install`; verify `ethos status` reports the current runtime. Runtime 043ab018 refused write admission as `runtime_build_stale`; `hook install` run from the runtime of ETHOS `d587f6dff` installed runtime 054e1f72 in this repository's Git store, and `ethos status` reports it current.

## 2. Normalization And Formatter Bindings

- [ ] 2.1 Add `.gitattributes` (`* text=auto eol=lf` last) and `.editorconfig` (`[*]` charset, end_of_line, insert_final_newline); verify Git renormalizes no tracked file and the paradigm report has no text-normalization gap.
- [ ] 2.2 Move the Prettier configuration to `.config/checks/prettier/prettier.toml` and its ignore file to `.config/checks/prettier/prettierignore` with unchanged settings and exclusions; verify Prettier ignores the same captured originals and `npm run format:check` passes.
- [ ] 2.3 Bind taplo at `.config/checks/taplo/taplo.toml` with the paradigm's column width, run it from `format:check` and `format:fix`, and format the TOML files; verify a second `npm run format:check` is clean.
- [ ] 2.4 Let the `formatting` gate run `npm run format:check` and point the README at the two verbs; verify the paradigm report has no gap.

## Workflow follow-up

- Resulting-HEAD proof, integration, official archive and exact lane retirement are native ETHOS and OpenSpec records.
