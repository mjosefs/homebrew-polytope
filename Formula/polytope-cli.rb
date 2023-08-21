class PolytopeCli < Formula
  desc "CLI for Polytope, the programmable development platform"
  homepage "https://polytope.com"
  url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/polytope-cli-0.1.0-macos-x86-64.tar.gz"
  sha256 "f539b5b75656e54b904ea38e355709d3e5ea28b6a355e07271637b52ae62c455"
  version "0.1.0"

  bottle :unneeded

  def install
    libexec.install "polytope"
    bin.install_symlink libexec/"polytope" => "polytope-cli"
    bin.install_symlink libexec/"polytope" => "pt"
  end

  test do
    system "#{libexec}/polytope", "--version"
  end
end
