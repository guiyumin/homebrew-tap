class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.30/maily_0.6.30_darwin_arm64.zip"
      sha256 "9721ad773103ac18002ca761a1e2e1669ca0f328257a1b79e72a44e8fbcda486"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.30/maily_0.6.30_darwin_amd64.zip"
      sha256 "3a532e6432bb1164cddb55b0a387f5c9d9b06bac778a29ffa3e58a0ad4cb1485"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
