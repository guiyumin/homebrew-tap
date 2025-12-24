class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.5.3/maily_0.5.3_darwin_arm64.zip"
      sha256 "fa2942143d4e8582921fc52971dfb263bbba3cfac819a51d9596d47669aa7399"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.5.3/maily_0.5.3_darwin_amd64.zip"
      sha256 "24da2a89b8535db031f7a7b8b750fbfda5bc2c50a2cd544477fe03b43f9c5998"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
