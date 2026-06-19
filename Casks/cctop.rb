# Casks/cctop.rb
# This formula is for the homebrew-cctop tap (github.com/st0012/homebrew-cctop)
# Copy this file to Casks/cctop.rb in that repo.
#
# Usage:
#   brew tap st0012/cctop
#   brew install --cask cctop
#
cask "cctop" do
  version "0.18.2"

  on_arm do
    url "https://github.com/st0012/cctop/releases/download/v#{version}/cctop-macOS-arm64.zip"
    sha256 "29811bff3bf79d0f73436e8592e12cb49bc9385e7c2d2c0431e79857033f1e4b"
  end
  on_intel do
    url "https://github.com/st0012/cctop/releases/download/v#{version}/cctop-macOS-x86_64.zip"
    sha256 "00dcf31c694433be522093a8e02697a210c8cc27f3c0d52f41f46c7f8dbffdb4"
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
