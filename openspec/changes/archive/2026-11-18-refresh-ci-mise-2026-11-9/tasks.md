## 1. Hosted supply

- [x] 1.1 Move `[supply] mise_version` to Mise 2026.11.9 and generate both pipelines again; done
      when `ethos lane project --check --json` reports both projections conforming. The check
      reports both conforming; only the workflow's Mise line changed.

## 2. Lock compatibility

- [x] 2.1 Read the tracked version-3 lock with the official Mise 2026.11.9 before landing; done when
      it lists the locked tools unchanged and the lock's bytes are unchanged. The host's Homebrew
      Mise 2026.11.9 lists `http:ethos` 0.2.0-beta.10 and node 26.13.1 under `MISE_LOCKED=1`; the
      lock's bytes are unchanged.
