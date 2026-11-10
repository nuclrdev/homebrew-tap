# Rendered by build/homebrew/render-cask.sh and pushed to nuclrdev/homebrew-tap
# by the platform-archives workflow. Edit the template in the commander repo,
# not the copy in the tap: the next release overwrites it.
cask "nuclr-commander" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.85"
  sha256 arm:   "bb32117b71c26f6cff9593ad94e6f309f3bd52ff38658264940acaaf165e782c",
         intel: "4d62e96be71eaee3dd90170a8e0f4aace4a1d7c1bb4227a877e000f6f1893137"

  # The counted redirect, so Homebrew installs show up in the download stats;
  # it resolves to the immutable object on downloads.nuclr.dev.
  url "https://nuclr.dev/downloads/nuclrdev/commander/#{version}/macos-#{arch}-dmg"
  name "Nuclr Commander"
  desc "Dual-pane file manager for developers"
  homepage "https://nuclr.dev/"

  livecheck do
    url "https://nuclr.dev/commander/version/latest.txt"
    regex(/v?(\d+(?:\.\d+)+)/i)
  end

  # Commander downloads new versions itself and the launcher installs them on
  # the next start, so `brew upgrade` leaves it alone unless run with --greedy.
  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Nuclr Commander.app"

  zap trash: [
    "~/.nuclr/commander",
    "~/Library/Application Support/nuclr",
    "~/Library/Saved Application State/dev.nuclr.commander.savedState",
  ]
end
