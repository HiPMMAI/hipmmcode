class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.0.0"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.0.0/hipmmcode-v1.0.0-darwin-universal.tar.gz"
  sha256 "5209e30d18615cdf5b8371f6d04172b4c8227cb8db0d21547b885e5e6bace714"

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
