class Hotfpc < Formula
  desc "Hot reloading for Free Pascal programs"
  homepage "https://github.com/frostney/hotfpc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/hotfpc/releases/download/1.2.0/hotfpc-1.2.0-macos-arm64.tar.gz"
      sha256 "6adfa72b5d66f68744c70586c76b0d18b32dace79181745f4b1672dbe7e14ce4"
    end

    on_intel do
      url "https://github.com/frostney/hotfpc/releases/download/1.2.0/hotfpc-1.2.0-macos-x64.tar.gz"
      sha256 "a72ddc5311b2257c7135203bd2e0273f9cd1d3f340517528612bbb5febafc555"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/hotfpc/releases/download/1.2.0/hotfpc-1.2.0-linux-arm64.tar.gz"
      sha256 "68b17a6fb9ac2619c22d055fc951bc3009d4d3c0a5a041c993d958b612af7711"
    end

    on_intel do
      url "https://github.com/frostney/hotfpc/releases/download/1.2.0/hotfpc-1.2.0-linux-x64.tar.gz"
      sha256 "6af4abb1e76fe76c27a6433469d122f78f06ffc2f137582a30f843b56c5fb48a"
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
