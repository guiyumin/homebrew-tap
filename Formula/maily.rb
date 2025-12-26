class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.11/maily_0.6.11_darwin_arm64.zip"
      sha256 "fc74fc288965c84cc8f5f3f84b06cbd612097eb793c0e1ce91865d94da0c1750"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.11/maily_0.6.11_darwin_amd64.zip"
      sha256 "82f4d8d14f5c6ba69603f39aea38e9cab4c59041ef1c1005987309a829055709"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
