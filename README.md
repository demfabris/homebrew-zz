# homebrew-zz

Homebrew tap for [zz](https://github.com/demfabris/zz) — a terminal multiplexer
whose panes are a terminal, a Chromium browser, or an AI agent.

```sh
brew install --cask demfabris/zz/zz
```

That installs `zz.app` and puts `zz` on your `PATH`.

`Casks/zz.rb` is generated. The release workflow in `demfabris/zz` renders it
from `packaging/homebrew/zz.rb` on every `v*` tag and pushes it here, so edit
the template there rather than this copy.
