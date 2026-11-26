class Hotfpc < Formula
  desc "Hot reloading for Free Pascal programs"
  homepage "https://github.com/frostney/hotfpc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/hotfpc/releases/download/1.2.1/hotfpc-1.2.1-macos-arm64.tar.gz"
      sha256 "6138f84ab5cec90ab17ffcfcd841eba3f8f245e887e4f2865523bc1175b5da45"
    end

    on_intel do
      url "https://github.com/frostney/hotfpc/releases/download/1.2.1/hotfpc-1.2.1-macos-x64.tar.gz"
      sha256 "e896d4dacd29dffee44489fbd6d2716158d15a37f515dc210ac26bb3008943b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/hotfpc/releases/download/1.2.1/hotfpc-1.2.1-linux-arm64.tar.gz"
      sha256 "36b2df015d2a056dbf0cd21fd5ac12ecb8a1ed256e4376688e12d1627388bfc2"
    end

    on_intel do
      url "https://github.com/frostney/hotfpc/releases/download/1.2.1/hotfpc-1.2.1-linux-x64.tar.gz"
      sha256 "af2dd910fbbf85048a2d9bcd954be3fccc6b062fd425698d8a855408be1f7fb3"
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
