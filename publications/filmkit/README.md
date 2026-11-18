# Film Kit

[`en/model.json`](en/model.json) is an Architecture Model of how Film Kit rebuilds a narrated film's Chinese and English editions from the film's tracked sources, and what holds each step to its inputs. It pins `filmkit` at v0.23.1 (`7b2308c470eb1bac8c60461110ac98863c4bdf93`), and its components own all 138 files of its coverage scope: the `src/filmkit` package, `pyproject.toml` and `VERSION`. Twenty-five components inside the engine, five outside it, sixty-six relations and six views show one edition's route from script to films, what the engine reads from a film, narration and its supply, one assembly for sound and captions, the picture's gate and render, and packaging, verification, delivery and review.

[`en/model.json`](en/model.json) also states the work's overview, which Architecture Publisher draws on one page: one edition's route from the declaration to a compared rebuild, what must hold before narration and before the render, the take a thought must give, what each record binds, and what the film holds, what is supplied and what is delivered.

[`en/guide/guide.archify.md`](en/guide/guide.archify.md) is the work's guide, an Archify explainer that Architecture Publisher delivers as its page. It opens with what the engine reads and leaves to the film, then follows one edition from script to films and the checks before narration. It shows how a thought's take reaches the soundtrack, what each record binds, what must pass before the picture renders and the parts that carry the build. It ends with what a delivered edition holds, how it is accepted and what is still open. Each claim cites a line range at v0.23.1, and the diagram files the draft names sit beside it.

Each component claims the files its path rules name, and each file goes to its most specific claim, so every file in the scope has one owner. The outside systems claim none: the film's repository, the speech models, the renderer and browser, the host tools and the independent reviewer. A relation is kept only where a call or a process call in the source backs it, and cites the modules that make it; not every call is drawn. The scope is the whole repository less its exclusions, each with its reason: the tests, the sample film, the OpenSpec specifications and Changes, the documentation and change log, the development locks and the repository's tooling and CI. Film Kit does not maintain this model, and a built delivery is not a Film Kit endorsement.

[`zh/`](zh/) holds the same files in Chinese, and [`concepts.md`](concepts.md) fixes each term's Chinese rendering beside the file that defines it. Each language is checked and built from its own directory.

```sh
archpub check publications/filmkit/en/model.json --repo <filmkit checkout>
archpub build publications/filmkit/en/model.json --repo <filmkit checkout> --out build/filmkit/en
```

Checking and building the work needs Architecture Publisher 0.15.0 or later, which draws the overview a model states, and building the edition needs Typst 0.15.1 on the path.
