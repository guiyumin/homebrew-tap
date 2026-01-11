class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.29/maily_0.6.29_darwin_arm64.zip"
      sha256 "59f1809d6280b36b50aabcbe9123cc0be2d34b76811196a7d46394fe72aadfac"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.29/maily_0.6.29_darwin_amd64.zip"
      sha256 "4ca4a2f86c39494dc5819817e729933ef8e6578eef85e28fa5b33938d12b0d36"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
