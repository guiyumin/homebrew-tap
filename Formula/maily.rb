class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.16/maily_0.6.16_darwin_arm64.zip"
      sha256 "ce6287af333e66c8782d0ee79855728e02439fed69b3352670ceeb0e369841d9"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.16/maily_0.6.16_darwin_amd64.zip"
      sha256 "577f25b023e3b46172b962b5ed25f3bdc4d7b1ba7ef1cc2d3b1e4d0a64c9e390"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
