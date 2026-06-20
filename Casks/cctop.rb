# Casks/cctop.rb
# This formula is for the homebrew-cctop tap (github.com/st0012/homebrew-cctop)
# Copy this file to Casks/cctop.rb in that repo.
#
# Usage:
#   brew tap st0012/cctop
#   brew install --cask cctop
#
cask "cctop" do
  version "0.18.3"

  on_arm do
    url "https://github.com/st0012/cctop/releases/download/v#{version}/cctop-macOS-arm64.zip"
    sha256 "789c853fff77fd122e3fa7e8d282d237670c5b0e0938b3ab4a58d4629c197ab2"
  end
  on_intel do
    url "https://github.com/st0012/cctop/releases/download/v#{version}/cctop-macOS-x86_64.zip"
    sha256 "fb963886a75d3b972685fd5d694d7dcc5b43ea582fd61963bce828519cf99bdc"
  end

  name "cctop"
  desc "Monitor AI coding sessions from the macOS menu bar"
  homepage "https://github.com/st0012/cctop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :ventura"

  app "cctop.app"
  binary "#{appdir}/cctop.app/Contents/MacOS/cctop-hook"


  zap trash: [
    "~/.cctop",
  ]
end
