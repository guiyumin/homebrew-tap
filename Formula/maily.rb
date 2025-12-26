class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.10/maily_0.6.10_darwin_arm64.zip"
      sha256 "b10de83a40f5a2f269452a6fddad0fc42d2934fcff794dd8eaacf62dc5e8e43c"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.10/maily_0.6.10_darwin_amd64.zip"
      sha256 "b4a4b1f44aa0719c769a8aab47d4a5235169953c336a394d433c430a3a2d0962"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
