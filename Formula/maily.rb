class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.8.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.8.7/maily_0.8.7_darwin_arm64.zip"
      sha256 "abf0084005788958375cd687010e08567efbb5faa83a5b7162eb73757c2d525e"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.8.7/maily_0.8.7_darwin_amd64.zip"
      sha256 "fc6c92a4a196f61306abfab6183f2c5b2ba57081842e0000c73c38385683bb72"
    end
  end

  def install
    bin.install "maily"
  end

  def post_install
    # Stop any running maily server to avoid version mismatch after upgrade.
    # The server will auto-start with the new version when user runs maily.
    pid_path = Pathname.new("#{Dir.home}/.config/maily/server.pid")
    sock_path = Pathname.new("#{Dir.home}/.config/maily/maily.sock")

    if pid_path.exist?
      pid = pid_path.read.split(":").first.to_i
      if pid > 0
        ohai "Stopping old maily server (PID #{pid})..."
        Process.kill("TERM", pid)
        sleep 0.5
      end
      pid_path.unlink rescue nil
      sock_path.unlink rescue nil
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maily --version")
  end
end
