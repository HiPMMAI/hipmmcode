class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.0.3"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.0.3/hipmmcode-v1.0.3-darwin-universal.tar.gz"
  sha256 "13dab2adab0d5c5c6b902a899b06f0746cef0f33b54d871a6e4fdea14c65e95e"

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
