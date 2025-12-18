class Vget < Formula
  desc "Media downloader CLI for various platforms"
  homepage "https://github.com/guiyumin/vget"
  url "https://github.com/guiyumin/vget/archive/refs/tags/v0.10.2.tar.gz"
  sha256 "d1844f558cb39a541d0b1eac447a31fc6371764f8a3976808b5224b6f3c75367"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/guiyumin/vget/internal/version.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/vget"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vget --version")
  end
end
