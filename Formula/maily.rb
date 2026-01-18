class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.7.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.7.11/maily_0.7.11_darwin_arm64.zip"
      sha256 "c9ff4f5e49180fda9894de54613119ab4f911dd4e4a4cf858219512e5cc78329"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.7.11/maily_0.7.11_darwin_amd64.zip"
      sha256 "47dda80412620921a41b8bc8fac1f02b695ffd5d6e77510725a1d8990397bc98"
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
