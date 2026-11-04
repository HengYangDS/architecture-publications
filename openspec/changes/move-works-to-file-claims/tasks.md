## 1. Inputs

- [ ] 1.1 Read model version 2 in the input check: a model claims at least one file and declares no digest; verify a version 2 model passes, and another version, a model without a claimed file and an abbreviated revision each fail.

## 2. Works

- [ ] 2.1 Move the ETHOS and AIGW works to version 2 with their generators' rules as claims; verify `archpub check --repo` gives every file of each scope one owner, AIGW's 210 as before and ETHOS's 455 with eight package initializers moved, seven to Contracts and schemas and one to Git and process observation.
- [ ] 2.2 Move the Architecture Publisher work to version 2 with `archpub migrate`; verify the check gives its 55 files the components they had.
- [ ] 2.3 Describe the claims in each work's README and the repository README; verify the formatting and input checks pass.

## 3. Verification

- [ ] 3.1 Build the three works with the publisher that reads version 2; verify each manifest records every file of the scope with its digest and owner, and every poster and overview is byte-identical to the build of the version 1 models.
