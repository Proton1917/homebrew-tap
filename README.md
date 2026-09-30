# Proton1917 Homebrew Tap

## Router

```sh
brew install --cask Proton1917/tap/router
open -a Router
```

支持 macOS 14 及以上版本、Apple Silicon。首次打开后，在界面中创建或选择配置，添加 API 凭据；安装向导可配置 `router` 及自定义终端命令。

```sh
brew upgrade --cask Proton1917/tap/router
brew uninstall --cask Proton1917/tap/router
```

Homebrew 管理 Router.app。已部署的后台程序、网页资源、路由配置和凭据由所选配置目录管理，关闭或卸载桌面应用后会保留。后台程序和网页资源的升级步骤见 [Router README](https://github.com/Proton1917/Router)。

当前安装包使用 ad-hoc 签名，尚未经过 Apple 公证。首次打开的 Gatekeeper 说明见项目 README。

## spt

Install the OpenRouter-powered speech transcription and OCR CLI:

```bash
brew install Proton1917/tap/spt
```

Apple Silicon macOS Tahoe uses a prebuilt bottle, so installation does not require a local Rust toolchain. FFmpeg remains a runtime dependency because `spt` uses it for media validation, decoding and exact audio slicing. Its codec packages account for most recursive Homebrew dependencies. Platforms without a matching bottle fall back to a locked build using Homebrew's Rust dependency and the system C build toolchain.

Upgrade:

```bash
brew upgrade Proton1917/tap/spt
```

`OPENROUTER_API_KEY` is read only when `spt` performs an OpenRouter request. It is not stored by the Formula, Homebrew, or the `spt` configuration file.

`spt` does not download a local speech model. Transcription and OCR media are sent to the configured OpenRouter routes.

## Lc0Chess

```bash
brew install --cask Proton1917/tap/lc0-chess
```
