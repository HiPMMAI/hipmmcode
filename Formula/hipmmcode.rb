class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "0.17.0"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v0.17.0/hipmmcode-v0.17.0-darwin-universal.tar.gz"
  sha256 "ea1d74951fe50cef8beec40fc60269eb928b01709eb7e9a8586921e95d609eb2"

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
