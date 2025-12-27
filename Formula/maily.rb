class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.14/maily_0.6.14_darwin_arm64.zip"
      sha256 "abb9487592453c9c94683cac6687bc819aa6540b52148ff507ea7407c1dd86c5"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.14/maily_0.6.14_darwin_amd64.zip"
      sha256 "d260acc6e893ae86cae04e707a7bb1544b909f92a7520ac79642ca7332d65bd3"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
