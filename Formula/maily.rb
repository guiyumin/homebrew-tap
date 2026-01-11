class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.25/maily_0.6.25_darwin_arm64.zip"
      sha256 "295be96ecfa010aaf96fc5f870a0ada17b86446403208011bc9aa85e6284dad9"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.25/maily_0.6.25_darwin_amd64.zip"
      sha256 "b90c7b5c5fefd9e128bc81b3d3ee6dc6b90c84b6b2978a4ca0d84afd8c933db8"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
