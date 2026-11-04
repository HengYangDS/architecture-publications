## Why

Architecture Publisher's model version 2 lets a component claim the files it
owns by path, a directory or one file, and records each cited file's digest in
the delivery instead of the model. The three works here are version 1 models,
which the publisher now refuses. The ETHOS and AIGW works list 455 and 210
files with authored digests, written by generators whose path rules live
outside this repository, so a reviewer cannot read why a file belongs to a
component.

## What Changes

- The ETHOS and AIGW works claim their files by their generators' path rules.
  AIGW's 210 files keep their components. Of ETHOS's 455, eight package
  initializers change component: seven join Contracts and schemas, where the
  rules put the package initializers, and one goes to Git and process
  observation, whose directory holds it. A claim that deeper claims leave empty
  is dropped.
- The Architecture Publisher work claims the 55 files its catalog listed,
  converted with `archpub migrate`.
- Outside systems claim no files; the relations that reach them cite the files
  that make the call, as before.
- The input check reads version 2: a model claims at least one file, and no
  digest is checked.
- The repository README and each work's README say what the components claim.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `publication-inputs`: a work's model claims its files by path, and the
  delivery's manifest records their digests.

## Impact

The input check and its tests, the three works' models and READMEs, and the
repository README. Checking and building need an Architecture Publisher that
reads version 2. The generators that wrote the ETHOS and AIGW models retire
with this Change.
