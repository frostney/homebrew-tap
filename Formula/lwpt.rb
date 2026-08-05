class Lwpt < Formula
  desc "Lightweight Pascal toolkit"
  homepage "https://github.com/frostney/lwpt"
  license "MIT"

  depends_on "fpc"

  on_macos do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.4.0/lwpt-0.4.0-macos-arm64.tar.gz"
      sha256 "a533005dab032fe5df1d0ae8fb9c394347fc8f8dd8c5d40a51d333decb909d0d"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.4.0/lwpt-0.4.0-macos-x64.tar.gz"
      sha256 "8f2ab12eff9bc60511d8ec98ee05c75cd5aaff9f58eb76d8075e06443b22bad0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.4.0/lwpt-0.4.0-linux-arm64.tar.gz"
      sha256 "02d5e3414ef72d0b8563232aa73a452dc7c7e553e2d1536b3f629b7f494fe93a"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.4.0/lwpt-0.4.0-linux-x64.tar.gz"
      sha256 "9635a66477542c4567b89c3a6764144e85d9f856c79f57a73ae5c373e5b3d92b"
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
