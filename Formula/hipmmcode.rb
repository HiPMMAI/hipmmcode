class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.3.1"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.3.1/hipmmcode-v1.3.1-darwin-universal.tar.gz"
  sha256 "71f57687321149f6c87e0f8252a82a802ce107cbcadf1cfba9251cdaac55250d"

  def install
    bin.install "hipmmcode"
    # Short launcher name.
    bin.install_symlink "hipmmcode" => "hm"
    # L1 default skills (docx/pptx/design/…) for first-launch sync.
    if File.directory?("default-skills")
      (share/"hipmmcode").install "default-skills"
    end
  end

  test do
    assert_match "hipmmcode", shell_output("#{bin}/hipmmcode --version")
  end
end
