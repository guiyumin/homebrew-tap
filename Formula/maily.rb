class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.7.0/maily_0.7.0_darwin_arm64.zip"
      sha256 "5c4f5df8d7c10991b4d5040c05ecdef932ec2db823e30ddca181b92b3193f126"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.7.0/maily_0.7.0_darwin_amd64.zip"
      sha256 "2ad4563d0fca02fd7a620dd228e7e2d5ef2b682bf526f0b21af7eb470c660124"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
