class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.3.0"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.3.0/hipmmcode-v1.3.0-darwin-universal.tar.gz"
  sha256 "2f9878d3c976225761da6a5b346a204400c6767fbc817035f475c4d94fb02fec"

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
