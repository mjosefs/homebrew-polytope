class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.17"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.17-macos-amd64.xz"
      sha256 "8e7c5f6594c03d3f471e85ffc9ab0b24d8a4e36037d160ca38c9aeb63213be2a"
    elsif Hardware::CPU.arm?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.17-macos-arm64.xz"
      sha256 "dd2f4d62aadf95db4f05c348d197ae622ff15b57a15eb44b506b6f6188d27b24"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.17-linux-amd64.xz"
      sha256 "7589b5b4ac03d2381b77f606c7af8be50a14d9ff4dce2eebd2805bc1e8841add"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    os = "#{OS.mac? ? 'macos' : 'linux'}"
    arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
    filename = "pt-0.1.17-#{os}-#{arch}"
    bin.install filename => "pt"
  end

  test do
    system "#{libexec}/polytope", "--version"
  end
end
