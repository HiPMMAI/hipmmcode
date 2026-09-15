class Hipmmcode < Formula
  desc "Provider-agnostic AI coding agent for your terminal"
  homepage "https://github.com/HiPMMAI/hipmmcode"
  version "1.1.0"
  url "https://github.com/HiPMMAI/hipmmcode/releases/download/v1.1.0/hipmmcode-v1.1.0-darwin-universal.tar.gz"
  sha256 "3bda422ebd3c52da17b20a54325f56636dc9e92854770743f9e36bfd279c2ec1"

  def install
    bin.install "hipmmcode"
    if File.directory?("default-skills")
      (share/"hipmmcode").install "default-skills"
    end
  end

  test do
    assert_match "hipmmcode", shell_output("#{bin}/hipmmcode --version")
  end
end
