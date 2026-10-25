class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.2.3"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.2.3/hipmmcode-v1.2.3-darwin-universal.tar.gz"
  sha256 "9527942319d00a8433949e97fc16568741d3ae0c5b0ad41e07496e00aed4eb4c"

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
