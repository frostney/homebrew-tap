class Gocciascript < Formula
  desc "ECMAScript engine for embedding"
  homepage "https://gocciascript.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/GocciaScript/releases/download/0.17.0/gocciascript-0.17.0-macos-arm64.zip"
      sha256 "3650c6ab2c62418be9d3aee505cb0995895891e7cc47cb5dde19ae93ebba9d35"
    end

    on_intel do
      url "https://github.com/frostney/GocciaScript/releases/download/0.17.0/gocciascript-0.17.0-macos-x64.zip"
      sha256 "5d42bf2e2f655d58585db09cee22f88ce9af03a5265db4bbac4be7b54aebc55d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/GocciaScript/releases/download/0.17.0/gocciascript-0.17.0-linux-arm64.tar.gz"
      sha256 "ab07a63a106815cb2050674c61cae3d46f2e36af6bce4f23b3e527fb7b256b3d"
    end

    on_intel do
      url "https://github.com/frostney/GocciaScript/releases/download/0.17.0/gocciascript-0.17.0-linux-x64.tar.gz"
      sha256 "c146cd5c0ca6cb5c824014e78a84bb201b6e15f1bf41295585388a51c75885dc"
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
