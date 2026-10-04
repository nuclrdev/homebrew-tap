# Rendered by build/homebrew/render-cask.sh and pushed to nuclrdev/homebrew-tap
# by the platform-archives workflow. Edit the template in the commander repo,
# not the copy in the tap: the next release overwrites it.
cask "nuclr-commander" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.59"
  sha256 arm:   "d88f050cdb7c005e07b9d2faef7a7d826f50900895f97281a9b3aafb63899250",
         intel: "42a1110fc378a5f66591addedbe5739563be08f273615ac4583c967ca02e1caf"

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
