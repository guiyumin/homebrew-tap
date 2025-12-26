class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.0/maily_0.6.0_darwin_arm64.zip"
      sha256 "1b6f3443b97cab8e68de58242c4bfa4133b7f8fb3533968b2aac3cf9487305ca"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.0/maily_0.6.0_darwin_amd64.zip"
      sha256 "eafa3fcc911c2eb6943250ab57baac7b1a4661c2a74a359beade01bbecc5e9e2"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
