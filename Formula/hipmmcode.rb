class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.0.1"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.0.1/hipmmcode-v1.0.1-darwin-universal.tar.gz"
  sha256 "f086488726eec70934af6364168277662fa25033dd3424d66564b6f29413a892"

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
