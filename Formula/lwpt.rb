class Lwpt < Formula
  desc "Lightweight Pascal toolkit"
  homepage "https://github.com/frostney/lwpt"
  license "MIT"

  depends_on "fpc"

  on_macos do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.5.1/lwpt-0.5.1-macos-arm64.tar.gz"
      sha256 "510663d53ec3a7671a6922f4932e7f16ad5990a53eef72acd838c734f30d4108"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.5.1/lwpt-0.5.1-macos-x64.tar.gz"
      sha256 "e3eff97c1697c62284f5d842bcd81791c34d0bb914e4a44cdf5ae52f0520b025"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.5.1/lwpt-0.5.1-linux-arm64.tar.gz"
      sha256 "20dabd0fd20f7aee240d688ecf9967ff3501798f814672abb33c60a2ca8ed439"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.5.1/lwpt-0.5.1-linux-x64.tar.gz"
      sha256 "f7a16bf7d079b010b5d7c68adc489496769b331a8b993dcb5c7a45376e0cea6e"
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
