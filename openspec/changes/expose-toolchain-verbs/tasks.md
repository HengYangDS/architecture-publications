# Tasks

## 1. Runtime

- [x] 1.1 Switch the hooks to the current ETHOS runtime with `hook install`; done when `ethos status` reports it current and the repair preview names only the three toolchain verbs. The runtime of ETHOS `d56b670fc` is installed, `ethos status` is ready, and the preview names only `bootstrap`, `check` and `fix`.

## 2. Toolchain

- [ ] 2.1 Lock `prettier` 3.9.10 and `@taplo/cli` 0.7.0 as development dependencies with a tracked `package-lock.json` that Prettier ignores; done when `npm ci --ignore-scripts` installs them and `npm run format:check` passes with the locked binaries.
- [ ] 2.2 Add `bootstrap`, `check` and `fix` scripts to `package.json`; done when each runs and the paradigm report is conforming.

## Workflow follow-up

- Resulting-HEAD proof, integration, official archive and exact lane retirement are native ETHOS and OpenSpec records.
