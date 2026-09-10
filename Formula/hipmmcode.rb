class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.0.7"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.0.7/hipmmcode-v1.0.7-darwin-universal.tar.gz"
  sha256 "73758a665f33d2803b371acc073a684a59d1ceab60310167becce3e484ff855b"

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
