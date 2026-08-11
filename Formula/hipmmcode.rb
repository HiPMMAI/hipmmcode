class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.0.0"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.0.0/hipmmcode-v1.0.0-darwin-universal.tar.gz"
  sha256 "2168968aff447516c4c0ce3cc52ef7ff5b5e17f27625b9ab128afdc8ab51c1a4"

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
