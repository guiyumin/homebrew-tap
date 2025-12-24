class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.5.1/maily_0.5.1_darwin_arm64.zip"
      sha256 "f4b1ce0f97bc4a0636456da370c53206e1c15b216bfcd6a97447bef37066bf19"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.5.1/maily_0.5.1_darwin_amd64.zip"
      sha256 "d5d6d04dc813a5de4dfb665b85c7571bd9122995362d5e34e61e32a29cdfa8b5"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
