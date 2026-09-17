# juthrbog Homebrew tap

Homebrew formulae for projects maintained by [juthrbog](https://github.com/juthrbog).

## awss

[awss](https://github.com/juthrbog/awss) is an interactive AWS profile and region
switcher for bash, zsh, and fish.

**Status:** the tap is initialized. `Formula/awss.rb` will be published by awss's
first stable release once its release workflow is merged. Until then, install
from source with `go install github.com/juthrbog/awss@latest`.

Once the formula is available:

```bash
brew install juthrbog/tap/awss
```

This fully qualified command installs and trusts the specific formula, not every
formula in the tap. See Homebrew's [tap trust documentation](https://docs.brew.sh/Tap-Trust).

Enable shell integration after installation:

```bash
# Bash (~/.bashrc)
eval "$(awss init bash)"

# Zsh (~/.zshrc)
eval "$(awss init zsh)"
```

```fish
# Fish (~/.config/fish/config.fish)
awss init fish | source
```

Start a new shell, then run `awss`. The formula also installs shell completions.

## Maintenance

- Source code, binary release assets, formula templates, and publishing automation
  live in [juthrbog/awss](https://github.com/juthrbog/awss).
- Stable awss releases generate `Formula/awss.rb` with platform-specific download
  URLs and SHA-256 checksums. Do not edit generated formulae here.
- A write-enabled deploy key scoped to **this repository only** lets the awss
  release workflow update the formula. Its private key is stored in awss's
  `HOMEBREW_TAP_SSH_KEY` Actions secret, never in either repository.
- Revoke/rotate that key in this repository's **Settings → Deploy keys**, then
  replace the corresponding Actions secret in awss.
- No separate bottle-building workflow is needed: the formula installs the
  already-built macOS/Linux release archives for amd64 and arm64.

See the [awss release guide](https://github.com/juthrbog/awss/blob/main/docs/releasing.md)
for publishing and verification steps (available once the distribution changes
are merged). Report awss bugs in the [awss issue tracker](https://github.com/juthrbog/awss/issues).

## License

Apache-2.0; see [LICENSE](LICENSE).
