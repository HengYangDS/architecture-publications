## ADDED Requirements

### Requirement: A work on GitHub or GitLab states its address once

A work whose repository's address is an `https` address on `github.com` or
`gitlab.com` SHALL NOT state `repository.browse` in any of its languages:
Architecture Publisher derives the browse template from that address. A work on
another host MAY state it.

#### Scenario: A template beside a GitHub address

- **WHEN** a work's model states `url: "https://github.com/o/shop.git"` and a
  `browse` template
- **THEN** the input check fails for that work

#### Scenario: A GitHub address alone

- **WHEN** a work's model states `url: "https://github.com/o/shop.git"` and no
  `browse`
- **THEN** the work passes

#### Scenario: A template beside an address on another host

- **WHEN** a work's model states `url: "https://git.example.invalid/o/shop"` and a
  `browse` template
- **THEN** the work passes
