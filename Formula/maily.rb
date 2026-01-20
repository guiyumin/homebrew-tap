class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.8.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.8.11/maily_0.8.11_darwin_arm64.zip"
      sha256 "5b175d280f639ae27be4d42cfb02e5b3bc5c17e19b6b179b4d8e9c8a0b83c4e4"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.8.11/maily_0.8.11_darwin_amd64.zip"
      sha256 "97cc9d262c1c9e49b7eb459c82809b78831ef8ce20cf7ed40774fd612c196be5"
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
