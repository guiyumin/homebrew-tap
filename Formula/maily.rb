class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.31/maily_0.6.31_darwin_arm64.zip"
      sha256 "de3df5842a5f263f0ece41fb43f88772d9ce66b7de07843f69c34841d280f116"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.31/maily_0.6.31_darwin_amd64.zip"
      sha256 "f35db5495a5cb4b9cf28c5fc2f0ee5dada7ebaef53ce678d1107b09327a303ba"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
