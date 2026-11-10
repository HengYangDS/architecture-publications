## 1. Hosted supply

- [x] 1.1 Move `[supply] mise_version` to Mise 2026.11.5 and generate both pipelines again; done
      when `ethos lane project --check --json` reports both projections conforming. The check
      reports both conforming; only the workflow's Mise line changed.

## 2. Lock compatibility

- [x] 2.1 Read the tracked version-3 lock with the official Mise 2026.11.5 before landing; done when
      it lists the locked tools unchanged and the lock's bytes are unchanged. The macOS archive
      `f69c8a4f…` lists `http:ethos` 0.2.0-beta.6 and node 26.13.0 under `MISE_LOCKED=1`; the lock's
      bytes are unchanged.
