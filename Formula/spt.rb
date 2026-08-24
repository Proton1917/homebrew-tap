class Spt < Formula
  desc "Safe OpenRouter-powered speech transcription and OCR CLI"
  homepage "https://github.com/Proton1917/speech-to-text"
  url "https://github.com/Proton1917/speech-to-text/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "13cbc70e9b848200dbbd4c4ce204561ff17726d17cea79383b957a45a0bc4fa0"
  license "MIT"

  bottle do
    root_url "https://github.com/Proton1917/speech-to-text/releases/download/v0.4.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "7daa24911c60dbb433cf11f04727eb1510f895c299313c7def475ed876069eb9"
  end

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
      Run `spt --help` to get started.
    EOS
  end

  test do
    ENV.delete "OPENROUTER_API_KEY"
    ENV["SPT_CONFIG_PATH"] = (testpath/"config.toml").to_s

    assert_match "spt #{version}", shell_output("#{bin}/spt --version")

    output = shell_output("#{bin}/spt config")
    assert_match "schema_version=3", output
    assert_match "model=google/gemini-3.5-flash-lite", output
    assert_match "quality_review_model=google/gemini-3.7-flash", output
    assert_match "OPENROUTER_API_KEY=未设置", output
    assert_path_exists testpath/"config.toml"
  end
end
