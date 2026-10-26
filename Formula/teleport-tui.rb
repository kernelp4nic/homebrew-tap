class TeleportTui < Formula
  desc "Terminal UI to browse, filter and connect to Teleport hosts"
  homepage "https://github.com/kernelp4nic/teleport-desktop"
  url "https://github.com/kernelp4nic/teleport-desktop/archive/refs/tags/tui-v0.1.3.tar.gz"
  sha256 "9672feee1241707702140370004eb3e2c02f6d818bf856591b99d5e784c743a8"

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
