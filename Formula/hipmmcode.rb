class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.0.6"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.0.6/hipmmcode-v1.0.6-darwin-universal.tar.gz"
  sha256 "b52ac9b76e2cdd1f9189dc6d1625c60938a017cfd0e6d8b7a5df95c02466cc55"

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
