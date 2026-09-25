class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.1.4"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.1.4/hipmmcode-v1.1.4-darwin-universal.tar.gz"
  sha256 "a0a0916c83c54e611fd9b40b69cfd9fe040789b043b94cf60403af234f4df1ef"

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
