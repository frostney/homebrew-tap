class Herakles < Formula
  desc "Bun-first workspace orchestrator for many repositories"
  homepage "https://github.com/frostney/herakles"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/frostney/herakles/releases/download/3.0.0/herakles-3.0.0-macos-arm64.tar.gz"
      sha256 "1812d51b338ddbbc172d8a75ca6c8833c2838f070a4e737efc666111ae94397f"
    end

    on_intel do
      url "https://github.com/frostney/herakles/releases/download/3.0.0/herakles-3.0.0-macos-x64.tar.gz"
      sha256 "4387c1047c83b156ccac87c642fec92c6a79ce0843c8cc8e9820e9006e6237e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/herakles/releases/download/3.0.0/herakles-3.0.0-linux-arm64.tar.gz"
      sha256 "4d80dd9e33ac5ce0ccdaa0e1047c3c8d7a4ea8991372495bc891329cc31fdb5a"
    end

    on_intel do
      url "https://github.com/frostney/herakles/releases/download/3.0.0/herakles-3.0.0-linux-x64.tar.gz"
      sha256 "c2e449b0b528cf3e4ed6bfe695b56a6253de3fd7a9ebf0d1376c516e79686257"
    end
  end

  def install
    chmod 0755, "herakles"
    bin.install "herakles"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herakles --version")
    assert_match "herakles init", shell_output("#{bin}/herakles --help")
  end
end
