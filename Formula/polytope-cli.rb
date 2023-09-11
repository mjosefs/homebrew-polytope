class PolytopeCli < Formula
  desc "CLI for Polytope, the programmable development platform"
  homepage "https://polytope.com"
  url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/polytope-cli-0.1.8-macos-x86-64.tar.gz"
  sha256 "ce5202e1fa8740d91e96b04a9a1e8333ed5da9772ab525f5c17563d149133b42"
  version "0.1.8"

  def install
    libexec.install "polytope"
    bin.install_symlink libexec/"polytope" => "polytope-cli"
    bin.install_symlink libexec/"polytope" => "pt"
  end

  test do
    system "#{libexec}/polytope", "--version"
  end
end
