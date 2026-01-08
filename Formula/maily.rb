class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.23/maily_0.6.23_darwin_arm64.zip"
      sha256 "2ed396648ca2102f983a7eb4df3f4879d992d49e658267586e1507e3fefc0ddf"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.23/maily_0.6.23_darwin_amd64.zip"
      sha256 "ad9e54e79ae1bf8dac952598852dfb393f7ea9fa15282ee45704afd4f39e848c"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
