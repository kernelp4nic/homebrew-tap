class LambdaTui < Formula
  desc "Terminal editor for Clojure projects: multi-cursor, structural edits, nREPL, clojure-lsp, git"
  homepage "https://github.com/kernelp4nic/lambda-tui"
  url "git@github.com:kernelp4nic/lambda-tui.git", tag: "v0.1.0", revision: "9bc9d349628e7a514c97ab0b06742e1f7d6ed954", using: :git
  head "git@github.com:kernelp4nic/lambda-tui.git", branch: "main", using: :git

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      The source repo is private: needs an SSH key with access to github.com:kernelp4nic/lambda-tui.
      Needs a truecolor terminal, with Option set as Meta for the Alt shortcuts.
      Optional: leiningen + a JDK for the REPL, clojure-lsp (run "Install clojure-lsp" from the palette), git.
      Ctrl-P opens the command palette, Ctrl-K ? lists every shortcut.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lambda-tui --version")
  end
end
