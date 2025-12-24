class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.5.2/maily_0.5.2_darwin_arm64.zip"
      sha256 "e445c9a2244abf99ce6081e3d03f51abaed7d7afa3b107cbf0a444bc7cc6b36a"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.5.2/maily_0.5.2_darwin_amd64.zip"
      sha256 "75b867fb65042f9948655cd9b5817217f3bfc1f0778cde9a52e6f3540321aa27"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
