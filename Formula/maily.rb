class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.7.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.7.4/maily_0.7.4_darwin_arm64.zip"
      sha256 "74238745556471d9be1080553d8ca8b1ab54d32dfbee6dbd133463b1a156fd86"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.7.4/maily_0.7.4_darwin_amd64.zip"
      sha256 "3a929dbe054f8be0a30ce63a6f36f64388d78c0133d0ee4ce5e6588633303069"
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
