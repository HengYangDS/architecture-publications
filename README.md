# Architecture Publications

Independent architecture authoring and publication for selected systems.
ETHOS and AIGW are read-only source products; neither installs or maintains
drawing code, Providers, publication tests or diagram CI gates.

## Works

- [ETHOS](publications/ethos/README.md): preserved design and artwork, selected from an exact source tree.
- [AIGW Client Projection](publications/aigw-client/README.md): direct standard model and editorial input.

Publisher supplies generic compilation and qualification. Archify supplies native
interactive rendering and reading; independent SVG/PNG6000 supplies static media.
Source meaning, independent editorial choices and exact artwork acceptance are
separate. A renderable input is not source endorsement or current implementation proof.

Use the owning OpenSpec Change for the migration and its acceptance boundaries.
Generated output and bounded verification remain under ignored `build/`.

## Input checks

Run `node --test tests/publication-inputs.test.mjs` to verify the current authored
members against their pins and confirm that direct builds consume local data.
Each `source.json` records the original source revision, preservation commit and
current member hashes. Original bytes remain recoverable from that Git commit.
These checks neither execute source products nor prove artwork qualification.

Run `prettier --config .config/checks/prettier.json --ignore-path
.config/checks/prettier.ignore --check .` for formatting; replace `--check` with
`--write` to fix the same declared inputs. Captured source originals are excluded
through Prettier's native ignore mechanism, not reformatted.
