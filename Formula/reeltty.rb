# Generated from the release's source archive. Do not edit manually.
class Reeltty < Formula
  desc "Keyboard-driven YouTube player that runs in the terminal"
  homepage "https://github.com/juthrbog/reeltty"
  url "https://github.com/juthrbog/reeltty/releases/download/v0.1.0/reeltty_0.1.0_source.tar.gz"
  sha256 "ebf0f8337263d4e687a08ceee667f86cc400013ec26ff623cf0c82ce4be03e24"
  license any_of: ["MIT", "Apache-2.0"]

  # Video frames use Linux shared memory (/dev/shm).
  depends_on :linux
  depends_on "rust" => :build
  depends_on "mpv"
  depends_on "yt-dlp"
  # yt-dlp needs a JavaScript runtime for full YouTube support.
  depends_on "deno"

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Video plays in Ghostty 1.3.1+ and kitty 0.49+, run directly (not in
      tmux or over SSH). Other terminals can browse, but not play.
      Run "reeltty doctor" to check your setup.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/reeltty --version")
  end
end
