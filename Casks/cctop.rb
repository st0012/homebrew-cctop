# Casks/cctop.rb
# This formula is for the homebrew-cctop tap (github.com/st0012/homebrew-cctop)
# Copy this file to Casks/cctop.rb in that repo.
#
# Usage:
#   brew tap st0012/cctop
#   brew install --cask cctop
#
cask "cctop" do
  version "0.21.3"

  on_arm do
    url "https://github.com/st0012/cctop/releases/download/v#{version}/cctop-macOS-arm64.zip"
    sha256 "5423628d401051917ed4e291790d571ee4899c59b4fcb26ca92efdc77e0c9029"
  end
  on_intel do
    url "https://github.com/st0012/cctop/releases/download/v#{version}/cctop-macOS-x86_64.zip"
    sha256 "62daa015ae7e47fad48325ea5b62f75ec5fc34b694ef63672c407787094c480a"
  end

  name "cctop"
  desc "Monitor AI coding sessions from the macOS menu bar"
  homepage "https://github.com/st0012/cctop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "cctop.app"
  binary "#{appdir}/cctop.app/Contents/MacOS/cctop-hook"


  zap trash: [
    "~/.cctop",
  ]
end
