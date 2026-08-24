# Proton1917 Homebrew Tap

## spt

Install the OpenRouter-powered speech transcription and OCR CLI:

```bash
brew install Proton1917/tap/spt
```

Apple Silicon macOS Tahoe uses a prebuilt bottle, so installation does not require a local Rust/LLVM toolchain. FFmpeg remains a runtime dependency because `spt` uses it for media validation, decoding and exact audio slicing. Platforms without a matching bottle fall back to a locked source build.

Upgrade:

```bash
brew upgrade Proton1917/tap/spt
```

`OPENROUTER_API_KEY` is read only when `spt` performs an OpenRouter request. It is not stored by the Formula, Homebrew, or the `spt` configuration file.

## Lc0Chess

```bash
brew install --cask Proton1917/tap/lc0-chess
```
