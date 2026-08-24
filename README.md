# Proton1917 Homebrew Tap

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
