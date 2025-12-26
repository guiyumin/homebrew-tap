class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.6.2/maily_0.6.2_darwin_arm64.zip"
      sha256 "c5e75dd451547ef334d8edbac5ad35125dceefcc61af1fd54664f3f32ad1d544"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.6.2/maily_0.6.2_darwin_amd64.zip"
      sha256 "a95ed924081c5d570777d63556ff482da7709390929e1c5d39cec3ebd085cec5"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
