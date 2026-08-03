class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "0.16.1"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v0.16.1/hipmmcode-v0.16.1-darwin-universal.tar.gz"
  sha256 "5d2566631113e98b33252c9324055ec7a7f23f3b782c09403fc9fd7058a95c17"

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
