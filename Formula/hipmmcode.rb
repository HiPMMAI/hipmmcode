class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.1.2"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.1.2/hipmmcode-v1.1.2-darwin-universal.tar.gz"
  sha256 "a596e8a922ff1cb85027ef70ec2e921bc14838359371617b70ed0e01fb16f481"

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
