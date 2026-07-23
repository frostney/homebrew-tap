class Lwpt < Formula
  desc "Lightweight Pascal toolkit"
  homepage "https://github.com/frostney/lwpt"
  version "0.3.0"
  license "MIT"

  depends_on "fpc"

  on_macos do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/#{version}/lwpt-#{version}-macos-arm64.tar.gz"
      sha256 "1cc46f7c718ca0cedd5194889fc54838dda08dc2466bb4ef3db9398bb00e3388"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/#{version}/lwpt-#{version}-macos-x64.tar.gz"
      sha256 "e5f5144ee9faac77accb0892a40cdcbdef91f538e49605b4de56671a09ffcd4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/lwpt/releases/download/#{version}/lwpt-#{version}-linux-arm64.tar.gz"
      sha256 "a8b8fa97fee620edc55bf1cb4c85fa48c07d26afb73bd6f7acd93a97d168c853"
    end

    on_intel do
      url "https://github.com/frostney/lwpt/releases/download/#{version}/lwpt-#{version}-linux-x64.tar.gz"
      sha256 "797cc83219724893c76b1c004fa762e3df647440600005d1e84c97426e285091"
    end
  end

  def install
    chmod 0755, "lwpt"
    bin.install "lwpt"
  end

  test do
    assert_match "lwpt #{version}", shell_output("#{bin}/lwpt --version")
    assert_match "Compile manifest targets", shell_output("#{bin}/lwpt --help")
  end
end
