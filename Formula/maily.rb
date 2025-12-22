class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.4.0/maily_0.4.0_darwin_arm64.zip"
      sha256 "PLACEHOLDER_ARM64"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.4.0/maily_0.4.0_darwin_amd64.zip"
      sha256 "PLACEHOLDER_AMD64"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
