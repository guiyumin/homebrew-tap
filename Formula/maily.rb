class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.34/maily_0.6.34_darwin_arm64.zip"
      sha256 "290cf35942776d0d0a98ddac3b86c293836751780bafec5508877fa139adc544"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.34/maily_0.6.34_darwin_amd64.zip"
      sha256 "c11975a4a66dbc9587d4ebc1086d1953f369451fd5c85143c65a3d1141da6bd6"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
