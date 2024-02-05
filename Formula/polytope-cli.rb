class PolytopeCli < Formula
  desc "CLI for Polytope, the programmable development platform"
  homepage "https://polytope.com"
  url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/polytope-cli-0.1.14-macos-x86-64.tar.gz"
  sha256 "3e4edea5524693ebb778782dc412b2d5b1f9c2110433b3874ec7293d2d37aadd"
  version "0.1.14"

  def install
    libexec.install "polytope"
    bin.install_symlink libexec/"polytope" => "polytope-cli"
    bin.install_symlink libexec/"polytope" => "pt"
  end

  test do
    system "#{libexec}/polytope", "--version"
  end
end
