class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.5.4/maily_0.5.4_darwin_arm64.zip"
      sha256 "1f7a3743c1bad8db1018ec6fd57b754fd2f28ae18092abafe8eff40eeb6004c8"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.5.4/maily_0.5.4_darwin_amd64.zip"
      sha256 "b310217d31cd172bbb146017c19be806188728ef1e499dcaaf602aab893cf209"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
