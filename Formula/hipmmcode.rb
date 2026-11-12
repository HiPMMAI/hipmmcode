class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.3.6"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.3.6/hipmmcode-v1.3.6-darwin-universal.tar.gz"
  sha256 "9bc70ba0fb90c593a61955a405c0bde6f8c6693e2b5eacf7c9b17585d206f9c6"

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
