class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.2.2"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.2.2/hipmmcode-v1.2.2-darwin-universal.tar.gz"
  sha256 "a668e72396748d7b89cfa2665dd3b123d7f9515c390f21ad09d68e6dc7ba2df5"

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
