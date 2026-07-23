class Gocciascript < Formula
  desc "Sandbox-first ECMAScript runtime"
  homepage "https://gocciascript.dev"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/GocciaScript/releases/download/#{version}/gocciascript-#{version}-macos-arm64.zip"
      sha256 "c197b4509987c19d0f16277cdbb74df330a7306530a84ba1e0ba0b0c5632be78"
    end

    on_intel do
      url "https://github.com/frostney/GocciaScript/releases/download/#{version}/gocciascript-#{version}-macos-x64.zip"
      sha256 "8d2d84c165c983a372ad33970dbd7d4246eaa1456a248ce2a0f17b37dd87f873"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/GocciaScript/releases/download/#{version}/gocciascript-#{version}-linux-arm64.tar.gz"
      sha256 "ad76243037da1da3ed57cf057a1698509b99c228652f016017a3f1260e13e011"
    end

    on_intel do
      url "https://github.com/frostney/GocciaScript/releases/download/#{version}/gocciascript-#{version}-linux-x64.tar.gz"
      sha256 "29fabd7a46f1e95745786cf45843b6b18e0a448f4345b5fa93e3a77cc435bccb"
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
