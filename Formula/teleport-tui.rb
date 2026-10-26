class TeleportTui < Formula
  desc "Terminal UI to browse, filter and connect to Teleport hosts"
  homepage "https://github.com/kernelp4nic/teleport-desktop"
  url "https://github.com/kernelp4nic/teleport-desktop/archive/refs/tags/tui-v0.1.2.tar.gz"
  sha256 "6a22c416a862c4d0cc7bfe37494b89cb3e7c5e54b0bab0557a9c49e80aeb2569"

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
