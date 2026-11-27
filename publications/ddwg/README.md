# Data Department Work Guidelines

[`en/model.json`](en/model.json) is an Architecture Model of how the Data Department
work guidelines lead a reader to the rule that owns a task, and how a change to
them is proposed, checked and released. It pins
`data-department-work-guidelines` at v10.1.3
(`127e15186115c1cf30e9f476e4991d587bf50500`), and its components own all 48
files of its coverage scope: the two entries, the task map, the eight topics,
the decision records, the maintenance documents, the OpenSpec workspace with
its six capability specs, and the ETHOS, tool, check and CI configuration.
Thirty-two components and seventy-three relations are drawn in six views: eight
topics led by the charter, where readers start, what Work practice asks of
each topic, one change from proposal to admission, what the checks read, and a
release on two Forges.

[`en/model.json`](en/model.json) also states the work's overview, which Architecture Publisher draws on one page: the route from two entries through the
task map to the eight topics, what the charter holds every topic to, the life
of one change and who owns what, and the release on its two Forges.

[`en/guide/guide.archify.md`](en/guide/guide.archify.md) is the work's guide, an
Archify explainer that Architecture Publisher delivers as its page. It opens
with who reads the guidelines and where they start, which topic owns which
work question, what the charter holds every topic to and how the topics hand
work to each other. It then shows which specs state what the guidelines must
do, how a change is proposed, checked and admitted, what the checks read and
how a release reaches two Forges. It ends with the decisions behind
the lifecycle and what is still open. Each claim cites a line range at v10.1.3,
and the diagrams the draft names sit beside it.

Each component claims the directories and files its path rules name, and each
file goes to its most specific claim, so every file in the scope has one owner.
Members and Agents, installed ETHOS and the two Forges claim none. A relation
records a link, a named path or a requirement by which one component routes a
reader to another, places a duty with it, constrains it, or generates, installs
or runs it, and cites the files that make that reference. The links between the
eight topics, links back to an entry or a hub page, and pointers that another
document already holds are not drawn.
The scope leaves out the archived Change history. The repository's owners do
not maintain this model, and a built delivery is not their endorsement.

[`zh/`](zh/) holds the same files in Chinese, and [`concepts.md`](concepts.md)
fixes each term's Chinese rendering beside the file that defines it. Each
language is checked and built from its own directory.

```sh
archpub check publications/ddwg/en/model.json --repo <data-department-work-guidelines checkout>
archpub build publications/ddwg/en/model.json --repo <data-department-work-guidelines checkout> --out build/ddwg/en
```

Checking and building the work needs the Architecture Publisher releases and the Typst that the repository's
[README](../../README.md) names.
