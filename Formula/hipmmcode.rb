class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.0.2"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.0.2/hipmmcode-v1.0.2-darwin-universal.tar.gz"
  sha256 "5a563b2649b2d08d8260c9f0b33224b8f3eaad59b3354c82771bb535701e1d35"

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
