## 1. Release age

- [x] 1.1 Add `.config/npm/npmrc` holding `min-release-age=1`, and under `[env]` in
      `.config/mise/config.toml` add `npm_config_userconfig = false` and `NPM_CONFIG_USERCONFIG =
      "{{ config_root }}/.config/npm/npmrc"`; done when, in the lane, `mise exec -- npm config get
      min-release-age` prints `1`, `mise exec -- npm config get userconfig` prints the repository's
      file, and `mise run bootstrap` leaves `package-lock.json` unchanged.
