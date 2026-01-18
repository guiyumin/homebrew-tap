class Maily < Formula
  desc "A terminal email client for Gmail"
  homepage "https://github.com/guiyumin/maily"
  version "0.7.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/guiyumin/maily/releases/download/v0.7.12/maily_0.7.12_darwin_arm64.zip"
      sha256 "8111cfa013fdeb0bc6932e847c104c3db2fd22abf1f6000a6a3f9382e6ec7575"
    else
      url "https://github.com/guiyumin/maily/releases/download/v0.7.12/maily_0.7.12_darwin_amd64.zip"
      sha256 "e5fb18682750e569e828f90f4da887d87e49c380ffba3376e6e75d04bd12af69"
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
