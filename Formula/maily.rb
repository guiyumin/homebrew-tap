class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.9/maily_0.6.9_darwin_arm64.zip"
      sha256 "73cdcc6cecbee878ab8d29e97d1939aa15f930bcdb1545a1fb56a44f51b8aa7e"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.9/maily_0.6.9_darwin_amd64.zip"
      sha256 "16a15dc6f42dce217ed8000d292ed5fd172df8f72dc52ccad758e2600e5c2b1f"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
