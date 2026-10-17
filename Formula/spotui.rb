# Generated from the release's SHA-256 checksums. Do not edit manually.
class Spotui < Formula
  desc "Terminal Spotify player that plays through your own speakers"
  homepage "https://github.com/juthrbog/spotui"
  version "0.1.1"
  license "GPL-3.0-only"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/juthrbog/spotui/releases/download/v0.1.1/spotui_0.1.1_darwin_arm64.tar.gz"
    sha256 "ba07aba75468908b7bac5d427f09b4f7ab3b8a9691dbf3c24c4382e49510a1cf"
  end

  on_linux do
    on_arm do
      url "https://github.com/juthrbog/spotui/releases/download/v0.1.1/spotui_0.1.1_linux_arm64.tar.gz"
      sha256 "f3394d885bbdf28ff8b7239752e8fa7a4d85da116c4e89615dacce89dfcf8c97"
    end
    on_intel do
      url "https://github.com/juthrbog/spotui/releases/download/v0.1.1/spotui_0.1.1_linux_amd64.tar.gz"
      sha256 "dc40504d69a8cbca94a8f9797f4b1e9f4b9f799c32060e4e92ad5b2e38851eed"
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
