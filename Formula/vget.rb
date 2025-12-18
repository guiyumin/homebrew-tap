class Vget < Formula
  desc "Media downloader CLI for various platforms"
  homepage "https://github.com/guiyumin/vget"
  version "0.10.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/vget/releases/download/v0.10.2/vget-darwin-arm64.zip"
      sha256 "d11ca7f0f0d268930d76c8d2d4e6ac48862c03ec777ef4c8177d365829bcf6bd"
    else
      url "https://github.com/guiyumin/vget/releases/download/v0.10.2/vget-darwin-amd64.zip"
      sha256 "2c4e5511ca3825f7e8b939000e1947e4362af701f90fb93d3ec55beb5cf8937f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/vget/releases/download/v0.10.2/vget-linux-arm64.zip"
      sha256 "93705a20f7cc8871453f09336c45d6a7486c34f6321168fc5087c236acffc0eb"
    else
      url "https://github.com/guiyumin/vget/releases/download/v0.10.2/vget-linux-amd64.zip"
      sha256 "ae639af8c93b06f0ef74253848c51d9d211c8bcddc131624aebc9baca92db7fb"
    end
  end

  def install
    bin.install "vget"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vget --version")
  end
end
