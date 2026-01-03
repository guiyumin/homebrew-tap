class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.19/maily_0.6.19_darwin_arm64.zip"
      sha256 "8ec2874d6c9cea3864036025aefffacbf07cdcbe54a4858e41f4a5e186d83463"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.19/maily_0.6.19_darwin_amd64.zip"
      sha256 "6ca42bf92367f0449f72ee905caefc47108fb3af2e22f6910deeadf1f4a5cc8d"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
