class Spt < Formula
  desc "Safe OpenRouter-powered speech transcription and OCR CLI"
  homepage "https://github.com/Proton1917/speech-to-text"
  url "https://github.com/Proton1917/speech-to-text/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "13cbc70e9b848200dbbd4c4ce204561ff17726d17cea79383b957a45a0bc4fa0"
  license "MIT"

  depends_on "rust" => :build
  depends_on "ffmpeg"

  def install
    system "cargo", "install", *std_cargo_args
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
