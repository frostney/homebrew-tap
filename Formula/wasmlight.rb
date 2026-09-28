class Wasmlight < Formula
  desc "WebAssembly runtime and native compiler for Object Pascal"
  homepage "https://github.com/frostney/wasmlight"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/wasmlight/releases/download/0.2.0/wasmlight-0.2.0-macos-arm64.tar.gz"
      sha256 "60a9ec49424293955d0ecf4789eacd71cd87efddc9602c1d40a946600a7b604b"
    end

    on_intel do
      url "https://github.com/frostney/wasmlight/releases/download/0.2.0/wasmlight-0.2.0-macos-x64.tar.gz"
      sha256 "b2cd5e4e1101fd6a404c091a830974ba0740c37dba30063fa345a1848df613a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/wasmlight/releases/download/0.2.0/wasmlight-0.2.0-linux-arm64.tar.gz"
      sha256 "37bf4f588d818dbea29f6bb0602877c598a2cb41e67775a1e95fa35cf05d4cb7"
    end

    on_intel do
      url "https://github.com/frostney/wasmlight/releases/download/0.2.0/wasmlight-0.2.0-linux-x64.tar.gz"
      sha256 "19cb4d66e9ee5915ae3a1de4073fd002c85425412a15047a09a27213a2a6ab79"
    end
  end

  def install
    raise "Missing compiler shell catalog" unless File.file?("share/wasmlight/shells/catalog")

    chmod 0755, "wasmlight"
    bin.install "wasmlight"
    share.install "share/wasmlight"
  end

  test do
    assert_match "wasmlight #{version}", shell_output("#{bin}/wasmlight --version")

    # A WASI command whose _start calls proc_exit(37): a placeholder shell
    # that merely exits 0 cannot pass.
    probe = [
      0x00, 0x61, 0x73, 0x6D, 0x01, 0x00, 0x00, 0x00, 0x01, 0x08, 0x02, 0x60,
      0x01, 0x7F, 0x00, 0x60, 0x00, 0x00, 0x02, 0x24, 0x01, 0x16, 0x77, 0x61,
      0x73, 0x69, 0x5F, 0x73, 0x6E, 0x61, 0x70, 0x73, 0x68, 0x6F, 0x74, 0x5F,
      0x70, 0x72, 0x65, 0x76, 0x69, 0x65, 0x77, 0x31, 0x09, 0x70, 0x72, 0x6F,
      0x63, 0x5F, 0x65, 0x78, 0x69, 0x74, 0x00, 0x00, 0x03, 0x02, 0x01, 0x01,
      0x05, 0x03, 0x01, 0x00, 0x01, 0x07, 0x13, 0x02, 0x06, 0x6D, 0x65, 0x6D,
      0x6F, 0x72, 0x79, 0x02, 0x00, 0x06, 0x5F, 0x73, 0x74, 0x61, 0x72, 0x74,
      0x00, 0x01, 0x0A, 0x08, 0x01, 0x06, 0x00, 0x41, 0x25, 0x10, 0x00, 0x0B
    ]
    (testpath/"probe.wasm").binwrite(probe.pack("C*"))

    system bin/"wasmlight", "compile", testpath/"probe.wasm", "-o", testpath/"probe"
    shell_output("#{testpath}/probe", 37)

    # The same-architecture shell for the other OS is packaged, not run.
    arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    other = OS.mac? ? "#{arch}-linux" : "#{arch}-darwin"
    system bin/"wasmlight", "compile", "--target", other, testpath/"probe.wasm", "-o", testpath/"probe-#{other}"
    assert_path_exists testpath/"probe-#{other}"
  end
end
