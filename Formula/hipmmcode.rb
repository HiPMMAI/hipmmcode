class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.3.3"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.3.3/hipmmcode-v1.3.3-darwin-universal.tar.gz"
  sha256 "eb53224c4c05f03ca08b0ec544fc7f417b3b4d0e68544da55393f4743b83dd65"

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
