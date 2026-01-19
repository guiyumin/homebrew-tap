class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.8.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.8.5/maily_0.8.5_darwin_arm64.zip"
      sha256 "3bf99311e8e2758a1c039a89b7ad0d80a245077abfeca7642bb220baec3c649e"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.8.5/maily_0.8.5_darwin_amd64.zip"
      sha256 "db9f6a320b57adf8849d23581d750998596f0d15f979173b4a17aac5a1eb97a1"
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
