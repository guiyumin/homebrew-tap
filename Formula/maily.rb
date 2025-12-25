class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.5.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.5.8/maily_0.5.8_darwin_arm64.zip"
      sha256 "a8e1e1a0ef029f3060b54e667d730d189184557fd70f6e3caf84a8b017a49c53"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.5.8/maily_0.5.8_darwin_amd64.zip"
      sha256 "66dff6977254475193be157bc62e3f0ebcaff37bbf4bdb66fe7b69a1eba4781a"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
