class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.6/maily_0.6.6_darwin_arm64.zip"
      sha256 "09ca1b8d0189ec489b1b48fc8073dc058dc49d1fe18b0f476991f11a3e2d097a"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.6/maily_0.6.6_darwin_amd64.zip"
      sha256 "2c8166ca5f7873bde0e7fad21f193d293fb571f4035d1b2e195b2785a8921a51"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
