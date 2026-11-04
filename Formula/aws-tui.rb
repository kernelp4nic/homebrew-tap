class AwsTui < Formula
  desc "AWS terminal explorer with embedded SSM sessions, powered by AWS CLI"
  homepage "https://github.com/kernelp4nic/aws-tui"
  url "https://github.com/kernelp4nic/aws-tui/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2ef31d04485f5166cc77556e9a713f493905f50d63b6e33fea4e34d746bdf681"
  license "MIT"

  depends_on "rust" => :build
  depends_on "awscli"

  def fetch
    ENV.prepend_path "PATH", formula_opt_bin("rust")
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    ENV.prepend_path "PATH", formula_opt_bin("rust")
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Uses your AWS CLI default profile and starts in read-only mode.
      Enable actions and SSM from the command palette with Ctrl+P.

      Embedded SSM sessions also require the Session Manager plugin:
        brew install --cask session-manager-plugin

      If the unrelated aws-tui cask is installed, remove it before linking:
        brew uninstall --cask aws-tui
        brew link aws-tui
    EOS
  end

  test do
    assert_match "Defaults to profile default and read-only", shell_output("#{bin}/aws-tui --help")
  end
end
