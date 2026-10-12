class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.2.1"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.2.1/hipmmcode-v1.2.1-darwin-universal.tar.gz"
  sha256 "d2cabd27a5edb76e296a34d2266a5f7a1acffc3ddd4de29f60b23a982e7b6488"

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
