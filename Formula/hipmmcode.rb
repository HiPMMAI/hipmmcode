class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.0.4"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.0.4/hipmmcode-v1.0.4-darwin-universal.tar.gz"
  sha256 "19a03ec6737db132751324f93602699fa0537caceebb86e3a8864e302f20981a"

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
