class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.0.5"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.0.5/hipmmcode-v1.0.5-darwin-universal.tar.gz"
  sha256 "02dd9edccf8d6b59faa4121860ea0175fdddc36335cc9da1ad07980cd019d540"

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
