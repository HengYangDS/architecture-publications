## Why

The owner asked on 5 November that every work follow its repository's latest
release. Three works fell behind within a day:

- The Architecture Publisher work is at v0.8.0; v0.9.0 was released on
  6 November.
- The AIGW work is at v0.6.0; v0.6.1 was released on 5 November.
- The filmkit work is at v0.9.0; v0.10.0 was released on 6 November.

The ETHOS work also lags, at v0.2.0-alpha.28, but its guide shows one measured
proof of the version it describes, so it moves in a Change of its own.

## What Changes

- Each of the three works moves to its repository's latest release, as its re-pin
  worklist from `archpub check --against` reports:
  - Architecture Publisher at v0.9.0 (`5a26416`): one owned file modified and
    23 guide citations shifted, each to the same text at its new lines.
  - AIGW at v0.6.1 (`abf0585`): the `terminal-domain` relation no longer cites
    the two files the release folded into `password.go`.
  - filmkit at v0.10.0 (`9a14f17`): `preflight.py` and `text_trace.py` gain a
    claim, 16 citations shift, and the 14 the release touched are read again;
    the guide states the new `preflight` action and the two new gated findings.
- What no citation shows is read against each release: the file counts the
  AIGW and filmkit overviews and READMEs state, filmkit's production actions,
  engine version, gate and review measures, and the modules that make four of
  its relations.
- Each work's README, guide answer line and diagram files name the new release.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None.

## Impact

`publications/architecture-publisher/`, `publications/aigw-client/` and
`publications/filmkit/`. The other three works do not change.
