class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.3/maily_0.6.3_darwin_arm64.zip"
      sha256 "95d040be08ebc257630c12d3fe3a89a4c05ee90ef9f33bca9b5d7375ebfc3409"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.3/maily_0.6.3_darwin_amd64.zip"
      sha256 "256b050cfa9c7cd92e4504145ae0966f44178456c7cb6d71ca6d1ef800e13e2c"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
