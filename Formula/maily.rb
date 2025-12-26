class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.4/maily_0.6.4_darwin_arm64.zip"
      sha256 "9897a04f0dbfaf327581aca68478026dddab0122baa2ded0e0edf7c433769868"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.4/maily_0.6.4_darwin_amd64.zip"
      sha256 "51d0766a2fe02c0d6e4173b7269378214165814d22f9445de50b5d0176e22e6c"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
