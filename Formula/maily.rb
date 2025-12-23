class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.5.0/maily_0.5.0_darwin_arm64.zip"
      sha256 "3b67e39a1b463a72569c1369680539b4613a7ec51034d05167ba0a3be1527c0b"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.5.0/maily_0.5.0_darwin_amd64.zip"
      sha256 "58045a27477036696f1966f9350a919628de1824421e1cc705d8f431bc6a8d92"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
