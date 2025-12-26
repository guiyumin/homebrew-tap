class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.7/maily_0.6.7_darwin_arm64.zip"
      sha256 "9f33f2a9dcf575f845fc44ae50cb55c9fd3cc415e87870c77da1d26e4539ffe1"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.7/maily_0.6.7_darwin_amd64.zip"
      sha256 "c15c57f47e79fa0af8c1cbaad4dfc64a33bdafbe36d7c6cc708633282d47e0f7"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
