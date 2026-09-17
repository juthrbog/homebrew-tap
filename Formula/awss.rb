# Generated from the release's SHA-256 checksums. Do not edit manually.
class Awss < Formula
  desc "Interactive AWS profile and region switcher"
  homepage "https://github.com/juthrbog/awss"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/juthrbog/awss/releases/download/v0.1.0/awss_0.1.0_darwin_arm64.tar.gz"
      sha256 "47452f31604633949c7355d22bb2756085b5f8b6e1edd31e3444b27c8ea78c70"
    end
    on_intel do
      url "https://github.com/juthrbog/awss/releases/download/v0.1.0/awss_0.1.0_darwin_amd64.tar.gz"
      sha256 "0dcaa218d01d1acf585c26ed9f991265773d68e39d0b5959e910d3d93c6157fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juthrbog/awss/releases/download/v0.1.0/awss_0.1.0_linux_arm64.tar.gz"
      sha256 "353a0bb9f6f9a0c3d97bc78a136376238e82f71a30b405889a9bae1ffe69573c"
    end
    on_intel do
      url "https://github.com/juthrbog/awss/releases/download/v0.1.0/awss_0.1.0_linux_amd64.tar.gz"
      sha256 "82941535e90b4f9b08bb583e6153eccab8cba9bdeedc89205a4cbbf798e85439"
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
