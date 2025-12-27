class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.13/maily_0.6.13_darwin_arm64.zip"
      sha256 "5b330d597d2d3e7481e9d6ae67ea9bbc04161e550b849d756a21778506b921c7"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.13/maily_0.6.13_darwin_amd64.zip"
      sha256 "81646426270a91a619f723f64aa0bd08ad956c8cee0d382b212664c20bd45a33"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
