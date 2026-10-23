class TeleportTui < Formula
  desc "Terminal UI to browse, filter and connect to Teleport hosts"
  homepage "https://github.com/kernelp4nic/teleport-desktop"
  url "https://github.com/kernelp4nic/teleport-desktop/archive/refs/tags/tui-v0.1.1.tar.gz"
  sha256 "656522baf7eeb9f3a3cd7c2bec084274a03dbed4a3194406279115cda4625bc9"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "tui")
  end

  def caveats
    <<~EOS
      Requires the Teleport client (tsh) and an active session, or run ctrl-l inside the app to log in.
      Optional config: ~/.config/teleport-tui/config
        proxy = teleport.example.com:443
        user = you
        op-item = Teleport   # 1Password item for autofill (needs the op CLI)
    EOS
  end

  test do
    assert_path_exists bin/"teleport-tui"
  end
end
