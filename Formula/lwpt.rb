class Lwpt < Formula
  desc "Lightweight Pascal toolkit"
  homepage "https://github.com/frostney/lwpt"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.7.0/lwpt-0.7.0-macos-arm64.tar.gz"
      sha256 "556bef4164ad404350ac36b79a3056121b325b337ce0e4240f95414d655cb538"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.7.0/lwpt-0.7.0-macos-x64.tar.gz"
      sha256 "3643919af2d77775bfdf84ec9551b9b9b975f596b2b156ed5906ee709781e3ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.7.0/lwpt-0.7.0-linux-arm64.tar.gz"
      sha256 "57da21404b048c88e98861ca3b42834817514386d1f6ae38469563b2fe1bd257"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.7.0/lwpt-0.7.0-linux-x64.tar.gz"
      sha256 "cf7457e08f7e73d80a2c6a4f5d98047b9aac39b7be0776469973a95bfc2e638c"
    end
  end

  def install
    chmod 0755, "lwpt"
    bin.install "lwpt"
  end

  test do
    assert_match "lwpt #{version}", shell_output("#{bin}/lwpt --version")
    assert_match "Compile manifest build entries", shell_output("#{bin}/lwpt --help")
  end
end
