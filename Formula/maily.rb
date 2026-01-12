class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.32/maily_0.6.32_darwin_arm64.zip"
      sha256 "c42a3ae0d83dbebf44fcbe8ea79abfca261cdaebff9898f7e3ee5071d9a3df38"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.32/maily_0.6.32_darwin_amd64.zip"
      sha256 "5194f33063f27f36b0f6d0e67cf37998dc48c05ac3f440845e866aed14e0f238"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
