class Lwpt < Formula
  desc "Lightweight Pascal toolkit"
  homepage "https://github.com/frostney/lwpt"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.9.0/lwpt-0.9.0-macos-arm64.tar.gz"
      sha256 "beda8117370fb466dcb0a7413eb276989003c2154ad075a079b6d9a6119cbdd4"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.9.0/lwpt-0.9.0-macos-x64.tar.gz"
      sha256 "dbb4a430f9ad8ef5ffa7f1825b0a8704ccee7c3c5450cd0c273187447c4153ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.9.0/lwpt-0.9.0-linux-arm64.tar.gz"
      sha256 "c20fdeff9ad309f4f1416837a8e836d28970f6629c82f323b8f75e7afc878667"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.9.0/lwpt-0.9.0-linux-x64.tar.gz"
      sha256 "3cb2785a058cbc054b03e83d392caeba8af080d5c1589d825b1ce53735d84978"
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
