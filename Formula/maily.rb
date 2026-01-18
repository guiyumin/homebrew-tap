class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.8.2/maily_0.8.2_darwin_arm64.zip"
      sha256 "0f380389d8e6ae8bd97b2fd83d2067693c3c8aa1ba80aec4b4806b6cedfa3149"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.8.2/maily_0.8.2_darwin_amd64.zip"
      sha256 "bb03f48d9b7caf8e93c9c0fb0374f3e97c4011712196ed6e49cd95a89d1e61cd"
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
