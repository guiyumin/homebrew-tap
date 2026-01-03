class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.17/maily_0.6.17_darwin_arm64.zip"
      sha256 "a4a0df8a6b20df31b8b95a7cd1a0e8e2709e4d767bf9a7119e6e9f7e6ad3df70"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.17/maily_0.6.17_darwin_amd64.zip"
      sha256 "08506d30e722c96cd37bb531641b9debcac64ae1238cbfaef1b1169d9acfdcb1"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
