class Lwpt < Formula
  desc "Lightweight Pascal toolkit"
  homepage "https://github.com/frostney/lwpt"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.8.0/lwpt-0.8.0-macos-arm64.tar.gz"
      sha256 "a20789541f7c1d5609305566fe213904c8b1580f6603ef696befdf73bfd049e7"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.8.0/lwpt-0.8.0-macos-x64.tar.gz"
      sha256 "a81bac04ffc3f6b0e6852d4b80ddebb3f0864b93e7d9d3f809d7b555f73b338e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.8.0/lwpt-0.8.0-linux-arm64.tar.gz"
      sha256 "533696b4903d0b887b63829338b987c66d87cf7023d1ee7b2c827866c414e33b"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.8.0/lwpt-0.8.0-linux-x64.tar.gz"
      sha256 "b9b7989f3e3be67c354f9c9767964fe68fd9a42e13bdac634dd24d95393cc9a2"
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
