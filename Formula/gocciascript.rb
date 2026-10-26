class Gocciascript < Formula
  desc "Sandbox-first ECMAScript runtime"
  homepage "https://gocciascript.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/GocciaScript/releases/download/0.15.1/gocciascript-0.15.1-macos-arm64.zip"
      sha256 "269af55de9206fbad017b3beb656c7a4a220c7099f364e2b4d7a1c5c6bed5d05"
    end

    on_intel do
      url "https://github.com/frostney/GocciaScript/releases/download/0.15.1/gocciascript-0.15.1-macos-x64.zip"
      sha256 "60aa5bbbd348c99e4a221c60e2a4ca075e2cd082c3796d9c32faa721559acdb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/GocciaScript/releases/download/0.15.1/gocciascript-0.15.1-linux-arm64.tar.gz"
      sha256 "35ca9cda93313a6af2161f77e587f503303a23ca0d3993051ef70334da2fc6a5"
    end

    on_intel do
      url "https://github.com/frostney/GocciaScript/releases/download/0.15.1/gocciascript-0.15.1-linux-x64.tar.gz"
      sha256 "574ee23bceb5c24b548a4934c20e06150e2e81ec0160024a8ffbbad42cb0d31d"
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
