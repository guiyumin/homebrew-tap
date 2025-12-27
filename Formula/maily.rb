class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.12/maily_0.6.12_darwin_arm64.zip"
      sha256 "a862986f9464c1fcd696edad2eaede66f0161541d46b9eb138a7c598a5f2eae2"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.12/maily_0.6.12_darwin_amd64.zip"
      sha256 "e8b6a8e0084fd53cf53805a26be2425f8f6806708ec966b4eb0152089138fe02"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
