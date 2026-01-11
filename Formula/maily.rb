class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.28/maily_0.6.28_darwin_arm64.zip"
      sha256 "1b9b6ac50f3f1da61779d59bfa6605b9375d84420f196673b3a9553cdd8e8d3c"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.28/maily_0.6.28_darwin_amd64.zip"
      sha256 "11bd85b99c26c89c146f5c0aa2e6d5d6dd9519f4afa2e4754f9693c9efff9eb5"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
