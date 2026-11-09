## Why

Re-pinning OpenAI Responses Proxy to v5.1.10 left three gaps in its work:

- `lifecycle/install.py`, `control.py` and `uninstall.py` import and call native supervision, but the model draws no
  relation from the lifecycle commands to it.
- Three relations cite files that import their target only for typing: the relay resolving routes and the exchange
  applying the wire policy through the provider registry, and the handoff checking the successor's identity. Each
  file does call the other component, through an object its caller hands it, but the model's stated rule admits only
  imports and process calls.
- The overview's failure panel does not list v5.1.10's recovery from an input-length or media-budget rejection.

## What Changes

- The model, in English and Chinese, relates the lifecycle commands to native supervision, which registers and removes
  it, and draws that relation in the supervision view, whose summary names it.
- The model's limits and the work's README state the relation rule the model follows: an import, a call on an object
  of the other component that the caller hands over, or a process call that carries behavior.
- The overview, in English and Chinese, adds the input-length recovery to its failure panel.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None: the work's content changes, not the input contract.

## Impact

`publications/openai-responses-proxy/`: both models, both overviews and the README. The six plates are typeset again
and the supervision plate gains a card; the other works do not change.
