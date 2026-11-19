## 1. Release age

- [x] 1.1 Declare `minimum_release_age = "24h"` under `[settings]` in `.config/mise/config.toml`;
      done when Mise prints `24h` for `mise settings get minimum_release_age` in the lane and
      `mise install --locked` installs the locked Node release unchanged.
