class Lwpt < Formula
  desc "Lightweight Pascal toolkit"
  homepage "https://github.com/frostney/lwpt"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.10.0/lwpt-0.10.0-macos-arm64.tar.gz"
      sha256 "c5a47b332fdf58ad627689ed9da7fe188fa1b8c300d8683795734758345afcc3"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.10.0/lwpt-0.10.0-macos-x64.tar.gz"
      sha256 "441a0657b0b4807bb75f030ac7c5650cf723a4b0662620a3645a0e354b0fbf7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/0.10.0/lwpt-0.10.0-linux-arm64.tar.gz"
      sha256 "299b8380622eb1e271e8de985e44e660a54c57878c57af8ec0319675afcb6a6f"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/0.10.0/lwpt-0.10.0-linux-x64.tar.gz"
      sha256 "c760932eb72d609afd7a6a2fa60a6011cf55d486987119b54321f878439797ed"
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
