# Rendered by build/homebrew/render-cask.sh and pushed to nuclrdev/homebrew-tap
# by the platform-archives workflow. Edit the template in the commander repo,
# not the copy in the tap: the next release overwrites it.
cask "nuclr-commander" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.83"
  sha256 arm:   "9fd4dc236f160cc8d48c5bd95dbf4d009db656a68946c3fe952cb59833772c7e",
         intel: "9973f2d768549cc2e85d475f5177b05c582422da5db341db05b385255b9c68f0"

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
