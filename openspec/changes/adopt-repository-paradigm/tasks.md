# Tasks

## 1. Runtime

- [x] 1.1 Switch the repository's hooks to the current ETHOS runtime with `hook install`; verify `ethos status` reports the current runtime. Runtime 043ab018 refused write admission as `runtime_build_stale`; `hook install` run from the runtime of ETHOS `d587f6dff` installed runtime 054e1f72 in this repository's Git store, and `ethos status` reports it current.

## 2. Normalization And Formatter Bindings

- [x] 2.1 Add `.gitattributes` (`* text=auto eol=lf` last) and `.editorconfig` (`[*]` charset, end_of_line, insert_final_newline); verify Git renormalizes no tracked file and the paradigm report has no text-normalization gap. Renormalizing a copy of the index changes only the intentionally edited files; the report has no text-normalization gap.
- [x] 2.2 Move the Prettier configuration to `.config/checks/prettier/prettier.toml` and its ignore file to `.config/checks/prettier/prettierignore` with unchanged settings and exclusions; verify Prettier ignores the same captured originals and `npm run format:check` passes. Prettier's file information ignores the same 39 captured originals before and after the move, and `npm run format:check` passes.
- [x] 2.3 Bind taplo at `.config/checks/taplo/taplo.toml` with the paradigm's column width, run it from `format:check` and `format:fix`, and format the TOML files; verify a second `npm run format:check` is clean. Homebrew taplo 0.10.0 reformatted `.ethos/profile.toml`; `npm run format:fix` then changes nothing and `npm run format:check` passes again.
- [x] 2.4 Let the `formatting` gate run `npm run format:check` and point the README at the two verbs; verify the paradigm report has no gap. The report has no gap, and the static and behavior providers pass under runtime 054e1f72.

## Workflow follow-up

- Resulting-HEAD proof, integration, official archive and exact lane retirement are native ETHOS and OpenSpec records.
