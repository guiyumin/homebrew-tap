class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.5.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.5.7/maily_0.5.7_darwin_arm64.zip"
      sha256 "8ac1a5b19e0df33af7f1218a3aaafaf503a2ef1b4180c44d013f657c40dc23fb"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.5.7/maily_0.5.7_darwin_amd64.zip"
      sha256 "4d129574d8ebb71d660e872211723e40502c61b88f4a7b0cfc90c65dae9c2375"
    end
  end

  def install
    bin.install "maily"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
