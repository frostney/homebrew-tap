class Lwpt < Formula
  desc "Lightweight Pascal toolkit"
  homepage "https://github.com/frostney/lwpt"
  license "MIT"

  depends_on "fpc"

  on_macos do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.5.0/lwpt-0.5.0-macos-arm64.tar.gz"
      sha256 "a217b7bcd703fab53bdd65db418caa094a06c0ff6336c77f372e6fe9e8a98730"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.5.0/lwpt-0.5.0-macos-x64.tar.gz"
      sha256 "decc509dcafcc293d54e6a218cd271e7715432e60ce9a352c2368dcc90d23436"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.5.0/lwpt-0.5.0-linux-arm64.tar.gz"
      sha256 "6cbba0afec95bdfc3ec532e052673144c682066778bf40e4253405b0a989be71"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.5.0/lwpt-0.5.0-linux-x64.tar.gz"
      sha256 "107617904bc33a11cc77a5c105fdd85bd510e11a101af74e5cd8943bdc8f673d"
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
