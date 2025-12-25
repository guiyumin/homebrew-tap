class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.5.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.5.9/maily_0.5.9_darwin_arm64.zip"
      sha256 "274f783a314f097d3e4402462f03eb6d801c2b414b280b54bcfcaf8d98848f3a"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.5.9/maily_0.5.9_darwin_amd64.zip"
      sha256 "3edc3c00284b7ff4a22caa7c6a79bc05bf8b3a10314aec2e8b6e1c8a377c7316"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
