class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.16"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.16-macos-amd64.xz"
      sha256 "7bb26ca87f1600ea12fcc2fe029d23a9980963943c9d5a199775baa5b315f50b"
    elsif Hardware::CPU.arm?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.16-macos-arm64.xz"
      sha256 "24e071e6c020fb37c1dac29703ea4a908a4d2368c9b5acb20f7597eb88846590"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.16-linux-amd64.xz"
      sha256 "1d2b37f952f309f8f1c091974d69af7ee09d0c836bad6e2721f263e2daa60b39"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    os = "#{OS.mac? ? 'macos' : 'linux'}"
    arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
    filename = "pt-0.1.16-#{os}-#{arch}"
    bin.install filename => "pt"
  end

  test do
    system "#{libexec}/polytope", "--version"
  end
end
