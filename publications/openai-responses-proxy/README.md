# OpenAI Responses Proxy

[`en/model.json`](en/model.json) is an Architecture Model of how OpenAI Responses Proxy makes a Codex
Responses turn portable across third-party providers, and how it installs and keeps its own
listener running. It pins `openai-responses-proxy` at v5.1.10
(`a36a33cf43ac518682d94da41b799a2a6649f988`), and its components own all 85 files of its coverage
scope: the `src/openai_responses_proxy` package with its provider manifest, `pyproject.toml` and
`VERSION`. Twenty-six components, forty-four relations and six views show one turn from the client
to a provider, what leaves the listener, how each failure stays bounded to its provider, one
install as one transaction, a new listener without a dropped turn, and what keeps it running.

[`en/overview.typ`](en/overview.typ) is the work's overview page, composed with Architecture Publisher's
house class: the route of one turn and the answer to each upstream failure, the transaction every
release is and the handoff every new listener is, and what keeps the listener running.

[`en/guide/guide.archify.md`](en/guide/guide.archify.md) is the work's guide, an Archify explainer that
Architecture Publisher delivers as its page. It opens with who sends traffic through the proxy and
what one turn crosses, then shows what a request keeps on its way out and when it may be sent
again. It ends with how a signed release becomes the serving generation, how an upgrade hands the
listening socket to a new process, what an installation writes and what keeps the listener
running. Each claim cites a line range at v5.1.10, and the diagrams the draft names sit beside it.

Each component claims the directories and files its path rules name, and each file in scope goes
to its most specific claim. The scope is the whole repository less its declared exclusions, each
with its reason: the tests, the repository tools, the OpenSpec specifications and change history,
the documents, CI and development configuration. A relation is kept only when an import or a
process call backs it, and cites the files that make it; imports used only for an exception
class, a type, a shared helper or the product's names are not drawn. The outside systems claim
no files. OpenAI Responses Proxy does not maintain this model, and a built delivery is not an
endorsement by its project.

[`zh/`](zh/) holds the same files in Chinese, and [`concepts.md`](concepts.md) fixes each term's
Chinese rendering beside the file that defines it. Each language is checked and built from its own
directory.

```sh
archpub check publications/openai-responses-proxy/en/model.json --repo <openai-responses-proxy checkout>
archpub build publications/openai-responses-proxy/en/model.json --repo <openai-responses-proxy checkout> --out build/openai-responses-proxy/en
```

Checking and building the work needs Architecture Publisher 0.10.2 or later, which reads model
version 3, and building the edition needs Typst 0.15.1 on the path.
