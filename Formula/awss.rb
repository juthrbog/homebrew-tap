# Generated from the release's SHA-256 checksums. Do not edit manually.
class Awss < Formula
  desc "Interactive AWS profile and region switcher"
  homepage "https://github.com/juthrbog/awss"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/juthrbog/awss/releases/download/v0.2.0/awss_0.2.0_darwin_arm64.tar.gz"
      sha256 "e77af167bf1c016dc9511eefcb474bff6fa8e7059e353eb161a696568d64089b"
    end
    on_intel do
      url "https://github.com/juthrbog/awss/releases/download/v0.2.0/awss_0.2.0_darwin_amd64.tar.gz"
      sha256 "07c290d87ec7ce9b16aff81a44f5ead5b02503232c68b0007c9d85419429543c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juthrbog/awss/releases/download/v0.2.0/awss_0.2.0_linux_arm64.tar.gz"
      sha256 "3c11e70c0575e7ce7a36ad9e0f23723333f38fb71a1154e8c3e4c1eb8c909674"
    end
    on_intel do
      url "https://github.com/juthrbog/awss/releases/download/v0.2.0/awss_0.2.0_linux_amd64.tar.gz"
      sha256 "d175cf6763615c5b6ca6f1e15708e182101670580c7f3486745242319e8f38a9"
    end
  end

  def install
    bin.install "awss"
    bash_completion.install "completions/awss.bash" => "awss"
    zsh_completion.install "completions/_awss"
    fish_completion.install "completions/awss.fish"
  end

  def caveats
    <<~EOS
      Enable shell integration to change your current shell:
        Bash: eval "$(awss init bash)"
        Zsh:  eval "$(awss init zsh)"
        Fish: awss init fish | source
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/awss --version")
    (testpath/"config").write("[profile testing]\nregion = us-east-1\n")
    assert_equal "testing\n", shell_output("#{bin}/awss list --config-file #{testpath}/config --credentials-file #{testpath}/missing")
  end
end
