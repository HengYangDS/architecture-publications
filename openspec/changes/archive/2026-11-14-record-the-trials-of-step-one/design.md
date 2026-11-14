## Context

See [proposal.md](proposal.md). The registration of 2026-11-14 put the trials' rules here and left the records to
follow. The runs were made from Architecture Publisher's working directory by scripts that this repository does not
admit, and each trial's working record was written there as its runs ended.

## Goals / Non-Goals

**Goals:**

- Every decision the first step took can be read here with the numbers behind it, and rescored from the data.

**Non-Goals:**

- Correcting a work. What a trial found wrong in a published work is listed, and a later Change corrects it.
- The trial scripts, which stay outside and are named by the SHA-256 of the bytes that ran.
- Raw session streams, which hold whole repositories' text and images and are not needed to rescore anything.

## Decisions

- A record here is the working record's text with its references to working files replaced by the names those files
  have here, or by a plain statement where a working file is not carried over. A script makes the replacement and
  stops if a source sentence has changed.
- Data is carried as JSON, one file per trial: every run of the reader experiment with the paths it named, void
  first runs included; every figure reading with its answers; the form check's key and both holders' findings. The
  key names each plate by work, plate and release, without a path on the keeper's host.
- Two rule files were not committed here before their runs: the author's timing protocol and the items of the
  figure-reading check. Each is committed with its record and says where it stood before its run; the index says so
  too, since its first sentence would otherwise claim more than is true.
- One page gives the outcome: each trial's line, result and decision, and what follows for the roadmap. It claims
  no more than the records support and names the limits that apply to all of them.

## Risks / Trade-offs

- [A record here differs in substance from the working record] → Only references are replaced, each exactly once,
  by a script; the working records are kept until the roadmap's next step has read these.
- [The data files are large for a documentation repository] → About 240 KB together. Session streams, which are
  hundreds of megabytes, are left out.
