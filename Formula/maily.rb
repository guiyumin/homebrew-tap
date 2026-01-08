class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.20/maily_0.6.20_darwin_arm64.zip"
      sha256 "b3fb8995057ab48b7fc39930770974ab9b0ac8e370ed89d1662ceb95fa929c3a"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.20/maily_0.6.20_darwin_amd64.zip"
      sha256 "efd0fd8a355bb841026954d41102c3b47cdeca68db15bb211ea1461619b648b4"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
