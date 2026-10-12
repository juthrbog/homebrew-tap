# Generated from the release's SHA-256 checksums. Do not edit manually.
class Awss < Formula
  desc "Interactive AWS profile and region switcher"
  homepage "https://github.com/juthrbog/awss"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/juthrbog/awss/releases/download/v0.1.1/awss_0.1.1_darwin_arm64.tar.gz"
      sha256 "ff8d31c43161287518883d80ae100b476210811bb3c67dbd563e15ea23f4a0ba"
    end
    on_intel do
      url "https://github.com/juthrbog/awss/releases/download/v0.1.1/awss_0.1.1_darwin_amd64.tar.gz"
      sha256 "1700e6b95e2ec0ead68af005d33489cfa05a283100b5271f6eabce7599ac551b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juthrbog/awss/releases/download/v0.1.1/awss_0.1.1_linux_arm64.tar.gz"
      sha256 "fe391663b6b810d84ff98de4da2f8bac56e74769296645e9eebfea2395ecf041"
    end
    on_intel do
      url "https://github.com/juthrbog/awss/releases/download/v0.1.1/awss_0.1.1_linux_amd64.tar.gz"
      sha256 "7f3b658d5146c0f2428420c1fb921002934be82b08f6ea06ff77bc5d52f8a868"
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
