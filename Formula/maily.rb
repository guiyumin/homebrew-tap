class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.15/maily_0.6.15_darwin_arm64.zip"
      sha256 "6f29cf460c7034343e99bd7ca6f198562da606030e1aa00967dcc128095556e6"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.15/maily_0.6.15_darwin_amd64.zip"
      sha256 "dd70fb9801f77320169dce08816cbcf212d4f964fcb3ad3beeff4c4636fc5a14"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
