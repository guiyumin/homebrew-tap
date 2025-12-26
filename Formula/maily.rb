class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.1/maily_0.6.1_darwin_arm64.zip"
      sha256 "48166d2c2378868b7f2a415835a22be6915c54cfb1c67be42656f59a5f725c5b"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.1/maily_0.6.1_darwin_amd64.zip"
      sha256 "3fb154e6296f81b3c56e684bd3db4ad4322e636d74564f376792622f4b614c72"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
