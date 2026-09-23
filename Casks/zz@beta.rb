# The casks published to github.com/demfabris/homebrew-zz. Their source lives
# in packaging/homebrew/zz.rb in demfabris/zz; the release workflow fills in
# the version and checksum with scripts/render-cask.sh and pushes the result to
# the tap, so edit the template rather than the published copies. The same
# template renders the `zz@beta` cask: the renderer retargets the token, the
# conflict, and drops livecheck, which only knows the stable release.
cask "zz@beta" do
  version "0.13.0"
  sha256 "24ff8a7b0cd4c86253c637f2383f58e4cda91663d68460324f24a79ba90606a0"

  url "https://github.com/demfabris/zz/releases/download/v#{version}/zz-#{version}-macos-arm64.dmg",
      verified: "github.com/demfabris/zz/"
  name "zz beta"
  desc "Terminal multiplexer with terminal, browser, and agent panes"
  homepage "https://github.com/demfabris/zz"

  conflicts_with cask: "zz"
  # The bundle carries a full Chromium; only the arm64 slice is released.
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "zz.app"
  # `cli` is the headless zz (CLI and daemon) that the app bundles.
  # The `zz` symlink on PATH points to it; `zz app` opens the desktop app.
  binary "#{appdir}/zz.app/Contents/MacOS/cli", target: "zz"

  zap trash: [
    "~/.config/zz",
    "~/Library/Application Support/zz",
    "~/Library/Saved Application State/dev.zz.app.savedState",
  ]
end
