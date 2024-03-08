class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.18"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.18-macos-amd64.xz"
      sha256 "5347f6442cf177259bf667ccc1260a4cda93172b677b3b9f053587fc6b5a8257"
    elsif Hardware::CPU.arm?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.18-macos-arm64.xz"
      sha256 "2fac79d44964c18ba47f859dfb5d91c4788af928a8a6c52afe006c6f288ea24e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.18-linux-amd64.xz"
      sha256 "5a639718894014cc0faf6f3fd5e0ec77e2924ae71d2b0609aa4569baebcdb71c"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    os = "#{OS.mac? ? 'macos' : 'linux'}"
    arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
    filename = "pt-0.1.18-#{os}-#{arch}"
    bin.install filename => "pt"
  end

  test do
    system "#{libexec}/polytope", "--version"
  end
end
