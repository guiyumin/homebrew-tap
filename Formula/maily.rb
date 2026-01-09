class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.24/maily_0.6.24_darwin_arm64.zip"
      sha256 "31ea7e61c1dbf913a256110da3e67d631edd453f158b4aa3c6a18248802cc876"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.24/maily_0.6.24_darwin_amd64.zip"
      sha256 "cfe9dac30306bc653863fe515d1e5dd2e387494126067dc129dd3c4ec697a29d"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
