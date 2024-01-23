class PolytopeCli < Formula
  desc "CLI for Polytope, the programmable development platform"
  homepage "https://polytope.com"
  url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/polytope-cli-0.1.11-macos-x86-64.tar.gz"
  sha256 "2c5fa62b2da3a5a3f9c2c78574e4d9acbbbcbdecfb9a51005f2e1a22417aa37f"
  version "0.1.11"

  def install
    libexec.install "polytope"
    bin.install_symlink libexec/"polytope" => "polytope-cli"
    bin.install_symlink libexec/"polytope" => "pt"
  end

  test do
    system "#{libexec}/polytope", "--version"
  end
end
