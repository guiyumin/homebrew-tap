class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.22/maily_0.6.22_darwin_arm64.zip"
      sha256 "aff353798b96eaa4a7a6394615d09b8812ffa9b09b97978f12a13b1c4d663e6c"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.22/maily_0.6.22_darwin_amd64.zip"
      sha256 "36e66e772d83a5e5c35c44d87a7d65b423b17652eafec220c67b4132a187846f"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
