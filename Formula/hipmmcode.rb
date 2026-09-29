class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.1.6"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.1.6/hipmmcode-v1.1.6-darwin-universal.tar.gz"
  sha256 "481757fa37263b82b33ce9541e90e66db45c468b8e0d916769e6ba0974c9d02c"

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
