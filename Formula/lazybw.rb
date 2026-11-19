# Generated from the release's SHA-256 checksums. Do not edit manually.
class Lazybw < Formula
  desc "Terminal UI for the Bitwarden password manager"
  homepage "https://github.com/juthrbog/lazybw"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.6.0/lazybw_0.6.0_darwin_arm64.tar.gz"
      sha256 "8b0e5cdacd5e4a71fb425f482ab7e727d965d8776193f9f653c992116c3f55e1"
    end
    on_intel do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.6.0/lazybw_0.6.0_darwin_amd64.tar.gz"
      sha256 "c895ced24d526a81083687e4f556379503c5a3b55593b86befc2f26b8b542df9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.6.0/lazybw_0.6.0_linux_arm64.tar.gz"
      sha256 "4297cdc23cbfbf32af68854d9121a834569c2379beac40601d7c49bfc5efe62d"
    end
    on_intel do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.6.0/lazybw_0.6.0_linux_amd64.tar.gz"
      sha256 "2ef972f83d0e435e68d177737f435384e8075719f6c59fdfcc2ebb76d6b2f606"
    end
  end

  def install
    bin.install "lazybw"
  end

  def caveats
    <<~EOS
      lazybw needs the Bitwarden CLI (bw) on your PATH.
      Install it with "brew install bitwarden-cli", or see
      https://bitwarden.com/help/cli/#download-and-install
      lazybw also needs a Nerd Font v3 and a terminal with OSC 52.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lazybw --version")
  end
end
