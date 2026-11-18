class Hotfpc < Formula
  desc "Hot reloading for Free Pascal programs"
  homepage "https://github.com/frostney/hotfpc"
  # hotfpc reloads programs for macOS on Apple silicon and Linux on x86-64, and its releases
  # have builds for those two only. Every system needs a URL, so the macOS build is the
  # default; the arch requirements below keep it off Intel Macs and arm64 Linux.
  url "https://github.com/frostney/hotfpc/releases/download/1.1.0/hotfpc-1.1.0-macos-arm64.tar.gz"
  sha256 "11e995d55988f22c2f28283763a258dc9131c629ff7637861bfe4179e96ac7fa"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/frostney/hotfpc/releases/download/1.1.0/hotfpc-1.1.0-linux-x64.tar.gz"
      sha256 "a5af2ed8f6b32d61d37eba52563f9aaa8e3faac7e0dea2842dc3a71c2a306cd3"
    end
  end

  def install
    chmod 0755, "hotfpc"
    bin.install "hotfpc"
  end

  test do
    assert_match "hotfpc #{version}", shell_output("#{bin}/hotfpc --version")
  end
end
