cask "router" do
  version "0.2.1"
  sha256 "8c6cf6b890cb13643b3a0a83ef7c2d37c1ad3140347c76ed3ce35afbc663ba38"

  url "https://github.com/Proton1917/Router/releases/download/v#{version}/Router_#{version}_aarch64.dmg"
  name "Router"
  desc "Configuration-driven API router with a desktop console"
  homepage "https://github.com/Proton1917/Router"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Router.app"

  zap trash: [
    "~/Library/Application Support/app.router.console",
    "~/Library/Caches/app.router.console",
    "~/Library/WebKit/app.router.console",
  ]

  caveats <<~EOS
    首次打开 Router 后，可在界面中创建或选择配置，并添加自己的 API 凭据。
    当前安装包采用 ad-hoc 签名，尚未经过 Apple 公证；首次打开说明见项目 README。
    后台程序、配置和凭据由所选配置目录管理，卸载桌面应用后会保留。
  EOS
end
