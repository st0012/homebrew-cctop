# Casks/cctop.rb
# This formula is for the homebrew-cctop tap (github.com/st0012/homebrew-cctop)
# Copy this file to Casks/cctop.rb in that repo.
#
# Usage:
#   brew tap st0012/cctop
#   brew install --cask cctop
#
cask "cctop" do
  version "0.6.1"

  on_arm do
    url "https://github.com/st0012/cctop/releases/download/v#{version}/cctop-macOS-arm64.zip"
    sha256 "4fd7cd253afc15a322b3335650acce3a0807f7d05230fdbfb578648e5a2ed7cb"
  end
  on_intel do
    url "https://github.com/st0012/cctop/releases/download/v#{version}/cctop-macOS-x86_64.zip"
    sha256 "0f2362ac72601804000ac36e5174fafbd1806ff8b630fcecdda839ba9b26ed14"
  end

  name "cctop"
  desc "Monitor AI coding sessions from the macOS menu bar"
  homepage "https://github.com/st0012/cctop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "cctop.app"
  binary "#{appdir}/cctop.app/Contents/MacOS/cctop-hook"

  caveats <<~EOS
    cctop is not notarized. On first launch, you may need to right-click
    the app and select "Open", or go to System Settings > Privacy & Security
    and click "Open Anyway".
  EOS

  zap trash: [
    "~/.cctop",
  ]
end
