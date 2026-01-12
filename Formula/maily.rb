class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.33/maily_0.6.33_darwin_arm64.zip"
      sha256 "879d0f43d934a72d143bc39e3c932c89e624673ea37be2581436e7f825c2115b"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.33/maily_0.6.33_darwin_amd64.zip"
      sha256 "faa51f0f1cb47bc9483858a01fb99d2dd1f15a148438550887022d8be4518c90"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
