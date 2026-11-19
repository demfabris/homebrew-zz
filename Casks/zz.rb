cask "zz" do
  version "0.28.0"
  sha256 "3e27f15ee396d5678aab2e2e771d9bcd3437a76c000aaee6434168fad20f6097"

  url "https://github.com/autistic-computer/zebrilus/releases/download/v#{version}/zz-#{version}-macos-arm64.dmg",
      verified: "github.com/autistic-computer/zebrilus/"
  name "zz"
  desc "Terminal multiplexer with terminal, browser, and agent panes"
  homepage "https://github.com/autistic-computer/zebrilus"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "zz@beta"
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "zz.app"
  binary "#{appdir}/zz.app/Contents/MacOS/cli", target: "zz"

  zap trash: [
    "~/.config/zz",
    "~/Library/Application Support/zz",
    "~/Library/Saved Application State/dev.zz.app.savedState",
  ]
end
