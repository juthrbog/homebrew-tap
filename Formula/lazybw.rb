# Generated from the release's SHA-256 checksums. Do not edit manually.
class Lazybw < Formula
  desc "Terminal UI for the Bitwarden password manager"
  homepage "https://github.com/juthrbog/lazybw"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.4.0/lazybw_0.4.0_darwin_arm64.tar.gz"
      sha256 "1765d448d1ab8e1c830f0d1c59b7aa86fd6034c8b1e7d1e510e7be26b8fd15da"
    end
    on_intel do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.4.0/lazybw_0.4.0_darwin_amd64.tar.gz"
      sha256 "381bd71f58458cfe3fdfa8a69137c482b1cd71408be4a027b0683070b84b6055"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.4.0/lazybw_0.4.0_linux_arm64.tar.gz"
      sha256 "c698fa8a756742af9fa2f89234eebe73ef118e9b7d7cd75799e07d6e72964c1c"
    end
    on_intel do
      url "https://github.com/juthrbog/lazybw/releases/download/v0.4.0/lazybw_0.4.0_linux_amd64.tar.gz"
      sha256 "5a1f20c4e0cd199ba2175615191d90f3b97f4240fd0166e873ceb7eaf2048317"
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
