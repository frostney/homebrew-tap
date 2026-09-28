class Gocciascript < Formula
  desc "Sandbox-first ECMAScript runtime"
  homepage "https://gocciascript.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/GocciaScript/releases/download/0.14.0/gocciascript-0.14.0-macos-arm64.zip"
      sha256 "ad4967f9eb6089721c0b519b58f63089423c4d99429591c4c7e3d9745e4076aa"
    end

    on_intel do
      url "https://github.com/frostney/GocciaScript/releases/download/0.14.0/gocciascript-0.14.0-macos-x64.zip"
      sha256 "bdd836e21dd0d146ed0349240fe6052ff8fec9893ad3b84301011c87bfb516ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/GocciaScript/releases/download/0.14.0/gocciascript-0.14.0-linux-arm64.tar.gz"
      sha256 "ae6ee19e2b7c54478ab2371671c55eef4feea8dd367dc8bc2f921055c381d15f"
    end

    on_intel do
      url "https://github.com/frostney/GocciaScript/releases/download/0.14.0/gocciascript-0.14.0-linux-x64.tar.gz"
      sha256 "3421c42d8c50563fbcd328d19c5fe1735c7ae583493b325e11e1b3c6168f3c0f"
    end
  end

  def install
    executables = %w[
      GocciaBenchmarkRunner
      GocciaBundler
      GocciaREPL
      GocciaRunner
      GocciaScriptLoaderBare
      GocciaTest262Runner
      GocciaTestRunner
      GocciaWasmTestRunner
    ]
    chmod 0755, executables
    bin.install executables
  end

  test do
    output = pipe_output("#{bin}/GocciaRunner --print", "Goccia.version;\n")
    assert_match version.to_s, output
  end
end
