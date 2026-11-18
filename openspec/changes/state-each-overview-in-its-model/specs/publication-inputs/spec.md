## REMOVED Requirements

### Requirement: A work may hold its overview composition

**Reason**: Architecture Publisher 0.15.0 draws the overview from what the model states and refuses a model that names a composition.

**Migration**: State the overview in the model's `overview` and remove the Typst file beside it.

## ADDED Requirements

### Requirement: A work states its overview in its model

A work MAY state its overview in each of its models, as the statement the
publisher draws. The input check SHALL fail a model whose `overview` names a
file or is no statement. Beside its guide's directory, a language directory
SHALL hold no file other than its model.

#### Scenario: A stated overview

- **WHEN** a work's model states an overview and its language directory holds the model and the guide's directory alone
- **THEN** the work passes

#### Scenario: A named composition

- **WHEN** a work's model names `overview.typ` in `overview`
- **THEN** the input check fails for that work and says that the overview is stated in the model

#### Scenario: A Typst file beside the model

- **WHEN** a language directory holds a `.typ` file
- **THEN** the input check fails for that work

### Requirement: The languages of a work state one overview

The overviews that the models of one work state SHALL have one shape: the same
blocks, steps, stations and items at the same places, and at each place the
same identifier and the same reference to a point, a view or a part. The input
check SHALL fail a work whose languages differ in it and SHALL name the first
place that differs.

#### Scenario: A reference one language lacks

- **WHEN** the English statement names a view at a station and the Chinese statement names none there
- **THEN** the input check fails for that work and names that station's `view`

#### Scenario: The same statement in other words

- **WHEN** two languages state the same blocks with the same identifiers and references, and every text differs
- **THEN** the work passes
