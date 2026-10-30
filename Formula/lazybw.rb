# Generated from the release's SHA-256 checksums. Do not edit manually.
class Lazybw < Formula
  desc "Terminal UI for the Bitwarden password manager"
  homepage "https://github.com/juthrbog/lazybw"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.5.0/lazybw_0.5.0_darwin_arm64.tar.gz"
      sha256 "11098dd57b54a524478fb626245782f5b4942ee27ed63b3c624a41dc6ea77dca"
    end
    on_intel do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.5.0/lazybw_0.5.0_darwin_amd64.tar.gz"
      sha256 "3ab14a7b3708ce9c3321cd62815dcc58b4937b94e40567897122498ed3a599bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.5.0/lazybw_0.5.0_linux_arm64.tar.gz"
      sha256 "0af4fad85d2e93d8a4e8dd21d2923409bb9ef035704bf52e5fd9fac2c5f535b1"
    end
    on_intel do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.5.0/lazybw_0.5.0_linux_amd64.tar.gz"
      sha256 "a111f8137d2ec348e30c1f6bda506afbff00e8f9499d4791994df347f26cb48b"
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
