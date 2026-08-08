class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "0.17.2"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v0.17.2/hipmmcode-v0.17.2-darwin-universal.tar.gz"
  sha256 "8bc08fd8ad8fc1f67759406a704e2e443deb2fe8e38484cd6c89fc90d3e47f3b"

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
