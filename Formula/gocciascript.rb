class Gocciascript < Formula
  desc "Sandbox-first ECMAScript runtime"
  homepage "https://gocciascript.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/GocciaScript/releases/download/0.13.0/gocciascript-0.13.0-macos-arm64.zip"
      sha256 "e2ca0bc6d05f1e5b433a580a0585664fefe52e5e0b6a9e0bf5e36ae30d40da1f"
    end

    on_intel do
      url "https://github.com/frostney/GocciaScript/releases/download/0.13.0/gocciascript-0.13.0-macos-x64.zip"
      sha256 "7444ac84cfdf518eeb907026edde2e57c192efc4f1fd7a3f9be18d40e49f0856"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/GocciaScript/releases/download/0.13.0/gocciascript-0.13.0-linux-arm64.tar.gz"
      sha256 "bc3aed0ba16bc13d7a3a46eeed0ad2c74f0175c4aa2dd67fe32ea2b7dddb159a"
    end

    on_intel do
      url "https://github.com/frostney/GocciaScript/releases/download/0.13.0/gocciascript-0.13.0-linux-x64.tar.gz"
      sha256 "398e370c1a99dbebce73d037ec4256d7ac89580c9541bf50047a3343bd8dc7da"
    end
  end

  def install
    executables = %w[
      GocciaBenchmarkRunner
      GocciaBundler
      GocciaREPL
      GocciaSandboxRunner
      GocciaScriptLoader
      GocciaScriptLoaderBare
      GocciaTestRunner
      GocciaWasmTestRunner
    ]
    chmod 0755, executables
    bin.install executables
  end

  test do
    output = pipe_output("#{bin}/GocciaScriptLoader --print", "Goccia.version;\n")
    assert_match version.to_s, output
  end
end
