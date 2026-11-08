## MODIFIED Requirements

### Requirement: Model prose describes the architecture

A work's model text, its title, question, summary, scope, limits, view
questions and details, SHALL describe the architecture and what the model
covers and leaves out. It SHALL NOT state that sources were verified or by
which digest; the publisher's manifest records each cited file's digest at the
pinned revision.

#### Scenario: A reader sees a work's limits

- **WHEN** the print edition sets a work's scope and limits
- **THEN** they name what the model covers and leaves out
- **AND** no line claims that a source was verified

### Requirement: Every view has a title

Each view of a work SHALL declare a short title of its own, different from the
model's title, that names what the view shows, so that its plate, its page
panel, the page's list of panels and its full viewer name that view.

#### Scenario: A view without a title

- **WHEN** a work's model declares a view with a question but no title
- **THEN** the input check fails and names that view
