class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.3.2"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.3.2/hipmmcode-v1.3.2-darwin-universal.tar.gz"
  sha256 "a53ec3c2b48640379fa87c4e6f073397e1b4920c88e01a237897434a9707e350"

  def install
    bin.install "hipmmcode"
    # Short launcher name.
    bin.install_symlink "hipmmcode" => "hm"
    # L1 default skills (docx/pptx/design/…) for first-launch sync.
    if File.directory?("default-skills")
      (share/"hipmmcode").install "default-skills"
    end
  end

  test do
    assert_match "hipmmcode", shell_output("#{bin}/hipmmcode --version")
  end
end
