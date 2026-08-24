class Spt < Formula
  desc "Safe OpenRouter-powered speech transcription and OCR CLI"
  homepage "https://github.com/Proton1917/speech-to-text"
  url "https://github.com/Proton1917/speech-to-text/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "76794ed7d7ae60664366796c237b63293fdb1a389bfb562c81c35e3aa955fd32"
  license "MIT"

  depends_on "rust" => :build
  depends_on "ffmpeg"

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Before transcription or OCR, set your OpenRouter API key in the shell environment:
        export OPENROUTER_API_KEY="your-key"

      spt reads the key only at runtime and never writes it to its configuration file.
      Audio and images are processed through the configured OpenRouter routes; spt does
      not download or keep a local speech model.

      FFmpeg is an intentional runtime dependency used for local media validation,
      decoding, and exact audio slicing. Its codec packages account for most recursive
      Homebrew dependencies.

      A matching bottle does not require a local Rust installation. Platforms without
      a matching bottle build from source using Homebrew's Rust build dependency and
      the system build toolchain.

      Run `spt --help` to get started.
    EOS
  end

  test do
    ENV.delete "OPENROUTER_API_KEY"
    ENV["SPT_CONFIG_PATH"] = (testpath/"config.toml").to_s

    assert_match "spt #{version}", shell_output("#{bin}/spt --version")

    help = shell_output("#{bin}/spt --help")
    assert_match "--verify-all", help
    assert_match "--asr-model", help
    assert_match "--quality-asr-model", help
    assert_match "--asr-provider", help
    assert_match "--quality-asr-provider", help
    refute_path_exists testpath/"config.toml"

    output = shell_output("#{bin}/spt config")
    assert_match "schema_version=4", output
    assert_match "model=google/gemini-3.7-flash", output
    assert_match "quality_review_model=google/gemini-3.7-flash", output
    assert_match "asr_model=qwen/qwen3-asr-1.7b", output
    assert_match "quality_asr_model=fish-audio/transcribe-1", output
    assert_match "provider=google-vertex/global", output
    assert_match "asr_provider=deepinfra", output
    assert_match "quality_asr_provider=fish-audio", output
    assert_match "OPENROUTER_API_KEY=未设置", output
    assert_path_exists testpath/"config.toml"
  end
end
