class Lwpt < Formula
  desc "Lightweight Pascal toolkit"
  homepage "https://github.com/frostney/lwpt"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.8.1/lwpt-0.8.1-macos-arm64.tar.gz"
      sha256 "711dbfdcf14a8b4f135902e470ed8ea06fe516f4c32990c555ae0846795bf4f6"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.8.1/lwpt-0.8.1-macos-x64.tar.gz"
      sha256 "0b096d7cb3b8705e81a3df2b8bdd3b7097b13389a2f7c825eba72320e1fc051a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.8.1/lwpt-0.8.1-linux-arm64.tar.gz"
      sha256 "c1ef87b034115fe15ca5babc48134c9c3cb8eec23f507b2b46e967a911f3aeb7"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.8.1/lwpt-0.8.1-linux-x64.tar.gz"
      sha256 "f8c4224df874ea11f3b2ef92f8b64cfde2783936d634e53292cc525b7c59629a"
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
