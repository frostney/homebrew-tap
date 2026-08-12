class Lwpt < Formula
  desc "Lightweight Pascal toolkit"
  homepage "https://github.com/frostney/lwpt"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.6.0/lwpt-0.6.0-macos-arm64.tar.gz"
      sha256 "2fe712f83af0f1ab7d1028f077b0b00f03bc11573b35803b99ac84776d597637"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.6.0/lwpt-0.6.0-macos-x64.tar.gz"
      sha256 "949ddb8f66926c4d4a324e73cdc7b74379d9531a9821b1805245b79d14fe14fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.6.0/lwpt-0.6.0-linux-arm64.tar.gz"
      sha256 "80c54ede6c53a3744c61fe0a3b5c9af10f62bf086359522a8d9ddf2616b5352a"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.6.0/lwpt-0.6.0-linux-x64.tar.gz"
      sha256 "308bd28118c9b669c12547c28fa0eb2f239e21f52bfc94b6fa0c4f6760770c0c"
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
