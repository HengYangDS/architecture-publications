# Design

## Context

See proposal.md for motivation. This repository holds publication inputs: 45
JSON files under `publications/`, a Node verification tool and its tests.
Prettier formats every tracked carrier except the captured source originals
that native tests pin byte for byte. Its configuration and ignore file sit
directly under `.config/checks/`, and the `formatting` gate runs the host's
Prettier with those two paths. The package declares commands only and installs
no dependencies.

## Goals / Non-Goals

**Goals:** satisfy every paradigm obligation with unchanged publication inputs
and pass the full proof under the current ETHOS runtime.

**Non-Goals:** changing publication inputs or captured originals, adding npm
dependencies, and defining fleet-wide `fix`/`check` verb names, which ETHOS
owns.

## Decisions

- Prettier's settings move unchanged into TOML. `printWidth = 100` and
  `proseWrap = "preserve"` are the paradigm's values; `singleQuote = true`
  stays as this repository's own choice, which the paradigm leaves open.
- The ignore file keeps every exclusion. Prettier resolves its patterns from
  the ignore file's directory, so each pattern gains one `../` for the deeper
  directory.
- taplo formats the TOML files at the paradigm's 100 columns. Like Prettier, it
  runs from the host's Homebrew installation, so the package still installs
  nothing.
- `format:check` and `format:fix` run Prettier and then taplo over the same
  declared inputs. The `formatting` gate runs `npm run format:check`, as the
  sibling architecture-publisher's gates run its npm verbs, so the gate and the
  developer verb cannot drift apart.
- `.gitattributes` ends with `* text=auto eol=lf`, and `.editorconfig` declares
  charset, line ending and final newline for every file.

## Risks / Trade-offs

- [The moved ignore file stops excluding a captured original] → Prettier's file
  information for each excluded path is compared before and after the move,
  and the native tests still verify every pin.
- [Text normalization rewrites a tracked file] → renormalizing a copy of the
  index must change no file.
- [The gate's new command changes the proof policy] → the full proof runs under
  the new policy before landing.
