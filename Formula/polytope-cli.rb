class PolytopeCli < Formula
  desc "CLI for Polytope, the programmable development platform"
  homepage "https://polytope.com"
  url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/polytope-cli-0.1.4-macos-x86-64.tar.gz"
  sha256 "bb8a11df9b246e3bc63b8cfffe1c83d5ad5c18aa2d5b6ea94a0e362c17d457f7"
  version "0.1.4"

  def install
    libexec.install "polytope"
    bin.install_symlink libexec/"polytope" => "polytope-cli"
    bin.install_symlink libexec/"polytope" => "pt"
  end

  test do
    system "#{libexec}/polytope", "--version"
  end
end
