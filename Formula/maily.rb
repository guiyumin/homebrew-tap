class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.4.4/maily_0.4.4_darwin_arm64.zip"
      sha256 "d33238a2c846df01e253c4e67bd2f214762c762c8b4921e087671b313a6f2388"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.4.4/maily_0.4.4_darwin_amd64.zip"
      sha256 "e62fd616cb01a16e35e3e844c7b35ad84cb75c1d9c337d39be6b424b9fb6758e"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
