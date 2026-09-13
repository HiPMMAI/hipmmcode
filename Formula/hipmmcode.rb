class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.0.10"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.0.10/hipmmcode-v1.0.10-darwin-universal.tar.gz"
  sha256 "f3a6aa1cbfd83ad234afd6d2df6fe1018f76aeb89d7357eeb10b1ce7203ac085"

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
