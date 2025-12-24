class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.5.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.5.6/maily_0.5.6_darwin_arm64.zip"
      sha256 "ddb8167cc313272aaf47a1fe73db8507eff088a10882b64359b9d631122016c2"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.5.6/maily_0.5.6_darwin_amd64.zip"
      sha256 "dcaf1be092f27ce6f59b138f43695681d286a1cd15ea3d138f08fb418aaf4671"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
