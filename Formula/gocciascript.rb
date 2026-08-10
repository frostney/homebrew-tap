class Gocciascript < Formula
  desc "Sandbox-first ECMAScript runtime"
  homepage "https://gocciascript.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/GocciaScript/releases/download/0.12.0/gocciascript-0.12.0-macos-arm64.zip"
      sha256 "8172cbd5f355ea79dd7721493fe8074870a4f2435c7af4464562711cc08ec797"
    end

    on_intel do
      url "https://github.com/frostney/GocciaScript/releases/download/0.12.0/gocciascript-0.12.0-macos-x64.zip"
      sha256 "01b64c8f14642f20c5c2647b768d2d78310b840232e4c18d273dfc5717f4b919"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/GocciaScript/releases/download/0.12.0/gocciascript-0.12.0-linux-arm64.tar.gz"
      sha256 "9c9e36f40822e0abc31c54a024bb50a3deb927678370cb9b2d92dccc31d45d00"
    end

    on_intel do
      url "https://github.com/frostney/GocciaScript/releases/download/0.12.0/gocciascript-0.12.0-linux-x64.tar.gz"
      sha256 "48896992ac759c6ff7ef817c397b37b9abe7d7de0789d78e9f66549b6857482d"
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
