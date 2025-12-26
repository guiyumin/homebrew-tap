class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.8/maily_0.6.8_darwin_arm64.zip"
      sha256 "ad9fdd90c5044c2d9b41789f32a9a6a14bbb173be9e331bbd464f592727c78a6"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.8/maily_0.6.8_darwin_amd64.zip"
      sha256 "77bfcee78ff4271e530a98b883f55068a1a8cae2878c4b6e96a45dedc80a9bc3"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
