class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.15"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.15-macos-amd64.xz"
      sha256 "c509b8cf0c5a56248b079a92e65f5581cfe61977ee9725331e43fc946d2ff308"
    elsif Hardware::CPU.arm?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.15-macos-aarch64.xz"
      sha256 "c509b8cf0c5a56248b079a92e65f5581cfe61977ee9725331e43fc946d2ff308"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.15-linux-amd64.xz"
      sha256 "c509b8cf0c5a56248b079a92e65f5581cfe61977ee9725331e43fc946d2ff308"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    libexec.install "pt-#{Hardware::CPU.arch}"
    bin.install_symlink "libexec/pt-#{Hardware::CPU.arch}" => "pt"
  end

  test do
    system "#{libexec}/polytope", "--version"
  end
end
