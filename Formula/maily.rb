class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.5.5/maily_0.5.5_darwin_arm64.zip"
      sha256 "2f60f1663676f2cb046098ec01ab2bb48ce8eb929e163a3e49704988bfeb00a2"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.5.5/maily_0.5.5_darwin_amd64.zip"
      sha256 "e1d0a304afe059f26703ffbd253fe469cc56c045731f34a95d2958b9636ac4e6"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
