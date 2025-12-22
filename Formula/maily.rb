class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.4.3/maily_0.4.3_darwin_arm64.zip"
      sha256 "71919799b75d4f9c2525e6456ccc22cd74486082ec29b08e49718c0165ab6b84"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.4.3/maily_0.4.3_darwin_amd64.zip"
      sha256 "6e6f3f267dadcb13c2ada66b86fe7bc4147664f8d59f8878fb4d53ae541fe675"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
