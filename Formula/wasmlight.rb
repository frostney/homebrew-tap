class Wasmlight < Formula
  desc "WebAssembly runtime and native compiler for Object Pascal"
  homepage "https://github.com/frostney/wasmlight"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/frostney/wasmlight/releases/download/0.2.1/wasmlight-0.2.1-macos-arm64.tar.gz"
      sha256 "363ffb09b9387a53921aae330a7ff5d58c51bffd7080c2e5aa3c52eeef760d91"
    end

    on_intel do
      url "https://github.com/frostney/wasmlight/releases/download/0.2.1/wasmlight-0.2.1-macos-x64.tar.gz"
      sha256 "8785c6f0141c21ff6ce14fadf71dfaff5fb7fdf03ad6d77fa7cb5117111df00b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/frostney/wasmlight/releases/download/0.2.1/wasmlight-0.2.1-linux-arm64.tar.gz"
      sha256 "78065c9c7071baf2411f02fb27a8d47c22f5cae115911b2fff866452a679b2bb"
    end

    on_intel do
      url "https://github.com/frostney/wasmlight/releases/download/0.2.1/wasmlight-0.2.1-linux-x64.tar.gz"
      sha256 "d0349d4a6a864ebe871d4cd466607d87926c70447eee210db88b1d0ba1979104"
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

    # Run by name from PATH, as a user types it: the compiler must find its
    # installed shell catalog from its own executable path, not argv[0] or
    # the current directory (wasmlight#167).
    shell_output("cd #{testpath} && PATH=#{bin}:$PATH wasmlight compile probe.wasm -o probe-by-name")
    shell_output("#{testpath}/probe-by-name", 37)

    # The same-architecture shell for the other OS is packaged, not run.
    arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    other = OS.mac? ? "#{arch}-linux" : "#{arch}-darwin"
    system bin/"wasmlight", "compile", "--target", other, testpath/"probe.wasm", "-o", testpath/"probe-#{other}"
    assert_path_exists testpath/"probe-#{other}"
  end
end
