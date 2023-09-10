class PolytopeCli < Formula
  desc "CLI for Polytope, the programmable development platform"
  homepage "https://polytope.com"
  url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/polytope-cli-0.1.6-macos-x86-64.tar.gz"
  sha256 "adb335988bead016c3d297fa7b6d5c223b281ee161b0b9c4f139249dba5a1782"
  version "0.1.6"

  def install
    libexec.install "polytope"
    bin.install_symlink libexec/"polytope" => "polytope-cli"
    bin.install_symlink libexec/"polytope" => "pt"
  end

  test do
    system "#{libexec}/polytope", "--version"
  end
end
