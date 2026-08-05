class Gocciascript < Formula
  desc "Sandbox-first ECMAScript runtime"
  homepage "https://gocciascript.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/GocciaScript/releases/download/0.11.0/gocciascript-0.11.0-macos-arm64.zip"
      sha256 "a566f62be536b24350ed4e8b089ba8946f75134e66ba1900641b1a70d3f8633f"
    end

    on_intel do
      url "https://github.com/frostney/GocciaScript/releases/download/0.11.0/gocciascript-0.11.0-macos-x64.zip"
      sha256 "14826916c1ea6fbddb1cd9365b2b5846ff629172e2b09099949e64beda273090"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/GocciaScript/releases/download/0.11.0/gocciascript-0.11.0-linux-arm64.tar.gz"
      sha256 "f7c0788ab70efa8123a5be7d1b267fe555a97753a3de8ffaf0279bcdd51b9e82"
    end

    on_intel do
      url "https://github.com/frostney/GocciaScript/releases/download/0.11.0/gocciascript-0.11.0-linux-x64.tar.gz"
      sha256 "fab93027d3598e33c218a7f20f0903051110dca5968b790e414440c86b9cf934"
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
