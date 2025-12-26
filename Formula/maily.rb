class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.5/maily_0.6.5_darwin_arm64.zip"
      sha256 "c4ea253325fc4f8a115a5d43e69a88103c5fc61cf810ec9674009ca84f85f196"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.5/maily_0.6.5_darwin_amd64.zip"
      sha256 "f04eb70794e1f8a59d7339d169d9ddc99153e0bd5b65744acc03ceeda1bffbf7"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
