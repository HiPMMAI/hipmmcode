class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.2.0"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.2.0/hipmmcode-v1.2.0-darwin-universal.tar.gz"
  sha256 "aed8d6e3848f322a6bf59a2761d8f497c25c34f73bfca1ee7667ef5b45d2fb4d"

  def install
    bin.install "hipmmcode"
    # L1 default skills (docx/pptx/design/…) for first-launch sync.
    if File.directory?("default-skills")
      (share/"hipmmcode").install "default-skills"
    end
  end

  test do
    assert_match "hipmmcode", shell_output("#{bin}/hipmmcode --version")
  end
end
