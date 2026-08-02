class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "0.16.0"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v0.16.0/hipmmcode-v0.16.0-darwin-universal.tar.gz"
  sha256 "faa8c152628df2abdbd1fa2cb67a91c6aaa8b027d9d7fa84daf92ad4aa932d36"

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
