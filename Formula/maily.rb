class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.21/maily_0.6.21_darwin_arm64.zip"
      sha256 "0c7c0463f9990c5f8281df25e83db1f3dad1bff0e595d19641d5a2099e66a291"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.21/maily_0.6.21_darwin_amd64.zip"
      sha256 "d076d0e91497cfccf9e8faa19246107e54a0825432c13bd8b260c748934becc7"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
