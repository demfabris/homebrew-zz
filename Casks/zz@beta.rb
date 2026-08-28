# The casks published to github.com/demfabris/homebrew-zz. Their source lives
# in packaging/homebrew/zz.rb in demfabris/zz; the release workflow fills in
# the version and checksum with scripts/render-cask.sh and pushes the result to
# the tap, so edit the template rather than the published copies. The same
# template renders the `zz@beta` cask: the renderer retargets the token, the
# conflict, and drops livecheck, which only knows the stable release.
cask "zz@beta" do
  version "0.3.2"
  sha256 "0d6eb71d521fa119c7dcc0e3ad43e11eed91e2e2647cf7614290e5dbd64d0ac4"

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
  # macOS resolves an app bundle from the path the executable was launched with
  # and does not follow symlinks doing it, so a symlink to Contents/MacOS/zz
  # would start zz with no Info.plist. `cli` is a launcher that canonicalizes
  # itself and execs the real executable from inside the bundle.
  binary "#{appdir}/zz.app/Contents/MacOS/cli", target: "zz"

  zap trash: [
    "~/.config/zz",
    "~/Library/Application Support/zz",
    "~/Library/Saved Application State/dev.zz.app.savedState",
  ]
end
