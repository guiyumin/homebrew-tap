class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.8.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.8.14/maily_0.8.14_darwin_arm64.zip"
      sha256 "4ebfdc68e9479593f08771ce7ac3f0a7657dc2e7bad5b7ada3ae4c0d40b970e4"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.8.14/maily_0.8.14_darwin_amd64.zip"
      sha256 "974cc7db332dd44b25be6836b9ca687a38152938159a19a1773f49fedbb23759"
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
