# Casks/cctop.rb
# This formula is for the homebrew-cctop tap (github.com/st0012/homebrew-cctop)
# Copy this file to Casks/cctop.rb in that repo.
#
# Usage:
#   brew tap st0012/cctop
#   brew install --cask cctop
#
cask "cctop" do
  version "0.5.0"

  on_arm do
    url "https://github.com/st0012/cctop/releases/download/v#{version}/cctop-macOS-arm64.zip"
    sha256 "5755cdc272e955945d639a1dcd928d03d5f1616ca802608104c940ef16b7dd9a"
  end
  on_intel do
    url "https://github.com/st0012/cctop/releases/download/v#{version}/cctop-macOS-x86_64.zip"
    sha256 "1607f98f15a137a86d724e3bfd8f148ee91e7a429cb12e1594d8198d273f6ba4"
  end

  name "cctop"
  desc "Monitor Claude Code sessions from the macOS menu bar"
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
