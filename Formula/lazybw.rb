# Generated from the release's SHA-256 checksums. Do not edit manually.
class Lazybw < Formula
  desc "Terminal UI for the Bitwarden password manager"
  homepage "https://github.com/juthrbog/lazybw"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.3.0/lazybw_0.3.0_darwin_arm64.tar.gz"
      sha256 "a75af73dfdf700037e43c4ca8e1676f30be67aec329480f192c0f067102ec407"
    end
    on_intel do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.3.0/lazybw_0.3.0_darwin_amd64.tar.gz"
      sha256 "5ca97e029aa2a9d52027a2589a128d9883f28f016cf80388da51c758d9e465d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.3.0/lazybw_0.3.0_linux_arm64.tar.gz"
      sha256 "783228ffcdbdf15da99591b6572d5645892502d090f531ac44f5cfc3767b93e3"
    end
    on_intel do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.3.0/lazybw_0.3.0_linux_amd64.tar.gz"
      sha256 "3fa74608a294d4532139b4b2578642523ccb0013d8818d4b3264fd20ac55f89f"
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
