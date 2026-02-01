cask "lc0-chess" do
  version "0.1.0"
  sha256 "ac5d84281b92a03aeb2ed5ed65dbf371a09eab49da4868f642cfd5d9726fcbc6"

  url "https://github.com/Proton1917/lc0-macos-app/releases/download/v#{version}/Lc0Chess-v#{version}.zip",
      verified: "github.com/Proton1917/lc0-macos-app/"
  name "Lc0Chess"
  desc "Native macOS chess app wrapping the Lc0 engine"
  homepage "https://github.com/Proton1917/lc0-macos-app"

  app "Lc0Chess.app"
end
