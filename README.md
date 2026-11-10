# alexg0/homebrew-tap

Personal Homebrew tap.

## Available formulae

- **db48x** - RPL calculator simulators: DM42-style db48x and color DM32-style db50x ([source](https://github.com/c3d/db48x))
- **md2pdf** — Multi-engine Markdown to PDF converter ([source](https://github.com/alexg0/md2pdf))

## Install

```bash
brew install alexg0/tap/md2pdf
brew install alexg0/tap/db48x
```

The db48x formula installs both simulators by default. Launch them with `db48x`
or `db50x`. To build only one, use `--without-db48x` or `--without-db50x`:

```bash
brew install alexg0/tap/db48x --without-db48x  # db50x only
brew install alexg0/tap/db48x --without-db50x  # db48x only
```

Disabling both is rejected. On macOS, installed app bundles are also available
under `$(brew --prefix db48x)` and can be opened with `open` or linked into
`/Applications`.

## Available casks

- **KeyVox** - Local-first macOS dictation with on-device speech recognition ([source](https://github.com/macmixing/keyvox)). Requires macOS Ventura 13.5 or later.

```bash
brew install alexg0/tap/keyvox
```

## How updates land

md2pdf updates are opened as PRs by [`.github/workflows/release.yml`](https://github.com/alexg0/md2pdf/blob/master/.github/workflows/release.yml) in `alexg0/md2pdf` whenever a `vX.Y.Z` tag is pushed. The workflow rewrites `url`, `sha256`, and `version` in `Formula/md2pdf.rb` and opens a PR here for review.

db48x updates are maintained manually, including its pinned submodule resources.
