# Generated from the release's SHA-256 checksums. Do not edit manually.
class Lazycloud < Formula
  desc "Terminal UI for browsing and managing AWS resources"
  homepage "https://github.com/juthrbog/lazycloud"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/juthrbog/lazycloud/releases/download/v0.6.0/lazycloud_0.6.0_darwin_arm64.tar.gz"
      sha256 "9c41e40c5c0c529e023824b31a7875d5700930f7e6c881e262a7580f8189fb01"
    end
    on_intel do
      url "https://github.com/juthrbog/lazycloud/releases/download/v0.6.0/lazycloud_0.6.0_darwin_amd64.tar.gz"
      sha256 "3797c0e7d1511c71b2e5b75957c2451397505d308b511808cbc71a38ed6cf8c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juthrbog/lazycloud/releases/download/v0.6.0/lazycloud_0.6.0_linux_arm64.tar.gz"
      sha256 "a4fcd0d555546f6ba81838c324112cebd58c079ed87bc8d2274b51a8a1363e06"
    end
    on_intel do
      url "https://github.com/juthrbog/lazycloud/releases/download/v0.6.0/lazycloud_0.6.0_linux_amd64.tar.gz"
      sha256 "be3dcf56e32e5b211f7305ce4cf00a41d76af8000a982db0f0422682d784603c"
    end
  end

  def install
    bin.install "lazycloud"
  end

  def caveats
    <<~EOS
      LazyCloud starts in ReadOnly mode. Press W to allow changes.
      SSM Connect needs the AWS CLI and the Session Manager plugin.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lazycloud --version")
  end
end
