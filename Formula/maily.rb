class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.26/maily_0.6.26_darwin_arm64.zip"
      sha256 "e188696e97d165786e39dc902a0caa21268c063d93b94c91d656881099a5d75e"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.26/maily_0.6.26_darwin_amd64.zip"
      sha256 "6ce154f8eadd93f3b3ff8e44c424207af7aed41db1eaada6de3f86f636fd05e3"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
