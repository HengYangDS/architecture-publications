# Tasks

## 1. Input check

- [x] 1.1 Replace the build-request and claim-model checks with the model check: format, version, full revision, a digest for every source, a unique id and only the model, README and custody record as a work's files; tests refuse each defect.
- [x] 1.2 Record every former AIGW and ETHOS member with Git storage, remove the originals, the build request and their Prettier ignore entries from the working tree, and verify every member at the preservation commit.

## 2. Works

- [x] 2.1 Write the AIGW model pinned to `aigw-cli` `ed9f0fd5`; `archpub check --repo` verifies its 14 sources and admits its four views.
- [x] 2.2 Write the ETHOS model pinned to ETHOS `ad9108d7`; `archpub check --repo` verifies its 65 sources and admits its four views.
- [x] 2.3 Rewrite each work's README with the model's question, scope, pin and the commands that check and build it.

## 3. Repository

- [x] 3.1 Rewrite the README for one pinned model per work, the retained originals and the check, build and publication steps.
- [x] 3.2 Build both works with `archpub build` into `build/` and inspect every poster and the map; every view renders within 1800 × 1350 px with no text below 14 px.
- [ ] 3.3 Pass `npm run check`, `openspec validate --strict` and the ETHOS proof.

## Workflow follow-up

- Archive the change, land the Work Lane and close it out through ETHOS.
