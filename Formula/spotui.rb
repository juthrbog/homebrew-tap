# Generated from the release's SHA-256 checksums. Do not edit manually.
class Spotui < Formula
  desc "Terminal Spotify player that plays through your own speakers"
  homepage "https://github.com/juthrbog/spotui"
  version "0.1.0"
  license "GPL-3.0-only"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/juthrbog/spotui/releases/download/v0.1.0/spotui_0.1.0_darwin_arm64.tar.gz"
    sha256 "b460c9bdd9036e0135c644e59dcf2950cd81c36b1a91478e85b01f6220e161ac"
  end

  on_linux do
    on_arm do
      url "https://github.com/juthrbog/spotui/releases/download/v0.1.0/spotui_0.1.0_linux_arm64.tar.gz"
      sha256 "2b3f8a52211835bff23985c2cf341fe1e1320448ee3e7c01d02cbc5bd621df3c"
    end
    on_intel do
      url "https://github.com/juthrbog/spotui/releases/download/v0.1.0/spotui_0.1.0_linux_amd64.tar.gz"
      sha256 "362e70b85fd928176d0d2c0ed9df3e51b2194e25f427f9b931a9b7fbaceaf08c"
    end
  end

  def install
    bin.install "spotui"
  end

  def caveats
    <<~EOS
      spotui needs Spotify Premium. On the first start, it opens a Spotify
      login page in your browser.

      Search and saved albums need your own Spotify developer app:
        https://github.com/juthrbog/spotui#set-up-search-and-saved-albums
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spotui -version")
  end
end
