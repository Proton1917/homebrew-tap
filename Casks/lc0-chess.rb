cask "lc0-chess" do
  version "0.1.0"
  sha256 "f785601d48525da9649443f1923a468442c7a6ea1e217f9a8f3561b150d44ba6"

  url "https://github.com/Proton1917/lc0-macos-app/releases/download/v#{version}/Lc0Chess-v#{version}.zip",
      verified: "github.com/Proton1917/lc0-macos-app/"
  name "Lc0Chess"
  desc "Native macOS chess app wrapping the Lc0 engine"
  homepage "https://github.com/Proton1917/lc0-macos-app"

  app "Lc0Chess.app"
end
