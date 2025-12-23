class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.4.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.4.5/maily_0.4.5_darwin_arm64.zip"
      sha256 "489f5cf3de7cd05118aeab87dfb4978df1a5cc7f253a2ea57cff90a0367f2735"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.4.5/maily_0.4.5_darwin_amd64.zip"
      sha256 "6a0b0677cdfce730359b935b160f525024e8bb6f3d272d5616cf0b8d66a3fc5e"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
