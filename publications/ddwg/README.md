# Data Department Work Guidelines

[`model.json`](model.json) is an Architecture Model of how the Data Department
work guidelines lead a reader to the rule that owns a task, and how a change to
them is proposed, checked and released. It pins
`data-department-work-guidelines` at v8.0.0
(`b9da15d3a57ed2a056af64d6c8adc3684a7b4f42`), and its components own all 48
files of its coverage scope: the two entries, the task map, the seven topics,
the decision records, the maintenance documents, the OpenSpec workspace with
its six capability specs, and the ETHOS, tool, check and CI configuration.
Thirty-one components and sixty-nine relations are drawn in six views: the
seven topics under one charter, where readers start, what work practice asks
of each topic, one change from proposal to admission, what the checks read, and
an edition on two Forges.

[`overview.typ`](overview.typ) is the work's overview page, composed with
Architecture Publisher's house class: the route from two entries through the
task map to the seven topics, what the charter holds every topic to, the life
of one change and who owns what, and the edition on its two Forges.

[`guide/guide.archify.md`](guide/guide.archify.md) is the work's guide, an
Archify explainer that Architecture Publisher delivers as its page. It opens
with who reads the guidelines and where they start, which topic owns which
work question, what the charter holds every topic to and how the topics hand
work to each other. It then shows which specs state what the guidelines must
do, how a change is proposed, checked and admitted, what the checks read and
how an edition is released on two Forges. It ends with the decisions behind
the lifecycle and what is still open. Each claim cites a line range at v8.0.0,
and the diagrams the draft names sit beside it.

Each component claims the directories and files its path rules name, and each
file goes to its most specific claim, so every file in the scope has one owner.
Members and Agents, installed ETHOS and the two Forges claim none. A relation
records a link, a named path or a requirement by which one component routes a
reader to another, places a duty with it, constrains it, or generates, installs
or runs it, and cites the files that make that reference. The links between the
seven topics, links back to an entry or a hub page, and pointers that another
document already holds are listed in [`notes.md`](notes.md) instead of drawn.
The scope leaves out the archived Change history. The repository's owners do
not maintain this model, and a built delivery is not their endorsement.

```sh
archpub check publications/ddwg/model.json --repo <data-department-work-guidelines checkout>
archpub build publications/ddwg/model.json --repo <data-department-work-guidelines checkout> --out build/ddwg
```

Checking the work needs an Architecture Publisher that reads model version 2
and delivers a guide as the page; building the overview needs Typst 0.15.1 on
the path.
