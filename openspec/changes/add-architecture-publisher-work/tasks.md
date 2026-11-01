## 1. Work

- [x] 1.1 Add `publications/architecture-publisher/model.json` from Architecture Publisher's `editions/self/model.json` at dev `009e84c`, with only its attribution changed to name this repository as the editor; verify `diff` shows that one line.
- [x] 1.2 Add `publications/architecture-publisher/README.md` stating what the model covers and leaves out and how to build it, in the form of the other works; verify it claims no source verification.
- [x] 1.3 List the work in `README.md` and expect the three works in `tests/publication-inputs.test.mjs`; verify `npm run check` passes.

## 2. Delivery

- [x] 2.1 Build the moved model in its original form with the released Architecture Publisher 0.7.0 package against a checkout of Architecture Publisher; verify every poster file is byte-identical to the published `architecture-publisher/0.7.0` delivery and the page's embedded viewer decompresses to identical content.
