# alexg0/homebrew-tap

Personal Homebrew tap.

## Available formulae

- **db48x** - RPL calculator and Qt desktop simulator in the spirit of the HP48 ([source](https://github.com/c3d/db48x))
- **md2pdf** — Multi-engine Markdown to PDF converter ([source](https://github.com/alexg0/md2pdf))

## Install

```bash
brew install alexg0/tap/md2pdf
brew install alexg0/tap/db48x
```

## Available casks

- **KeyVox** - Local-first macOS dictation with on-device speech recognition ([source](https://github.com/macmixing/keyvox)). Requires macOS Ventura 13.5 or later.

```bash
brew install alexg0/tap/keyvox
```

## How updates land

md2pdf updates are opened as PRs by [`.github/workflows/release.yml`](https://github.com/alexg0/md2pdf/blob/master/.github/workflows/release.yml) in `alexg0/md2pdf` whenever a `vX.Y.Z` tag is pushed. The workflow rewrites `url`, `sha256`, and `version` in `Formula/md2pdf.rb` and opens a PR here for review.

db48x updates are maintained manually, including its pinned submodule resources.
