class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.1.1"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.1.1/hipmmcode-v1.1.1-darwin-universal.tar.gz"
  sha256 "c8e9ab7888a09e4936213d4c51a79f547e583f0537a597c61d4598a6027efc12"

  def install
    bin.install "hipmmcode"
    if File.directory?("default-skills")
      (share/"hipmmcode").install "default-skills"
    end
  end

  test do
    assert_match "hipmmcode", shell_output("#{bin}/hipmmcode --version")
  end
end
