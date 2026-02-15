# Casks/cctop.rb
# This formula is for the homebrew-cctop tap (github.com/st0012/homebrew-cctop)
# Copy this file to Casks/cctop.rb in that repo.
#
# Usage:
#   brew tap st0012/cctop
#   brew install --cask cctop
#
cask "cctop" do
  version "0.6.0"

  on_arm do
    url "https://github.com/st0012/cctop/releases/download/v#{version}/cctop-macOS-arm64.zip"
    sha256 "89bd913b08b502bff87bba5d50b56e089c1eb7c987977e00f02ea078e4f7d442"
  end
  on_intel do
    url "https://github.com/st0012/cctop/releases/download/v#{version}/cctop-macOS-x86_64.zip"
    sha256 "4cc9f301cf223cde567c213d02b1e248cf223c30f12cccbd6d8f100c094d9b58"
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
