class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.18/maily_0.6.18_darwin_arm64.zip"
      sha256 "107a648e90df3fd17250f82098e6b18bcc280998620bbbcb953ec49bc079f960"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.18/maily_0.6.18_darwin_amd64.zip"
      sha256 "178be9b25449c22fb626bc3bc7c672a4eb406b4999f2fcdec7b5818197824012"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
