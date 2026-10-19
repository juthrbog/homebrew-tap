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

## spotui

[spotui](https://github.com/juthrbog/spotui) is a terminal Spotify player that
plays through your own speakers. It needs Spotify Premium.

```bash
brew install juthrbog/tap/spotui
```

The formula installs the release binary for macOS on Apple Silicon, or for Linux
on x86-64 and ARM64. On Linux, spotui uses the ALSA library of the system
(`alsa-lib` or `libasound2`). Start it with `spotui`. The first stable release of
spotui publishes `Formula/spotui.rb`.

## lazycloud

[lazycloud](https://github.com/juthrbog/lazycloud) is a terminal UI for browsing
and managing AWS resources.

```bash
brew install juthrbog/tap/lazycloud
```

The formula installs the release binary for macOS or Linux, on amd64 or ARM64.
SSM Connect also needs the AWS CLI and the Session Manager plugin. The next
stable release of lazycloud publishes `Formula/lazycloud.rb`.

## lazybw

[lazybw](https://github.com/juthrbog/lazybw) is a terminal UI for the Bitwarden
password manager.

```bash
brew install juthrbog/tap/lazybw
```

The formula installs the release binary for macOS or Linux, on amd64 or ARM64.
lazybw also needs the Bitwarden CLI (`bw`), for example from
`brew install bitwarden-cli`. The next stable release of lazybw publishes
`Formula/lazybw.rb`.

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
- spotui works the same way. Its release workflow generates `Formula/spotui.rb`,
  and a second deploy key, "spotui release publisher", lets it push. The private
  key is in spotui's `HOMEBREW_TAP_SSH_KEY` Actions secret. spotui has no
  binary for macOS on Intel, so its formula requires Apple Silicon on macOS.
- lazycloud works the same way. Its release workflow generates
  `Formula/lazycloud.rb`, and a third deploy key, "lazycloud release
  publisher", lets it push. The private key is in lazycloud's
  `HOMEBREW_TAP_SSH_KEY` Actions secret.
- lazybw works the same way. Its release workflow generates `Formula/lazybw.rb`,
  and a fourth deploy key, "lazybw release publisher", lets it push. The
  private key is in lazybw's `HOMEBREW_TAP_SSH_KEY` Actions secret.
- No separate bottle-building workflow is needed: the formula installs the
  already-built macOS/Linux release archives for amd64 and arm64.

See the [awss release guide](https://github.com/juthrbog/awss/blob/main/docs/releasing.md)
for publishing and verification steps (available once the distribution changes
are merged). Report awss bugs in the [awss issue tracker](https://github.com/juthrbog/awss/issues).

## License

Apache-2.0; see [LICENSE](LICENSE).
