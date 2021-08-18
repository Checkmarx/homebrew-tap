# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kics < Formula
  desc "Find security vulnerabilities, compliance issues, and infrastructure misconfigurations in your IaC"
  homepage "https://github.com/Checkmarx/kics"
  version "1.4.1"
  license "Apache"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Checkmarx/kics/releases/download/v1.4.1/kics_1.4.1_darwin_x64.tar.gz"
      sha256 "a9128de94c02dd8dd8150fceebdb8adca3ed99790349f3e031dd7abb24714b4a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Checkmarx/kics/releases/download/v1.4.1/kics_1.4.1_darwin_arm64.tar.gz"
      sha256 "9c6dac58e304378c1e2c391635dd7adcf0bfcf475d07608bda562bb0c3393ce8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Checkmarx/kics/releases/download/v1.4.1/kics_1.4.1_linux_x64.tar.gz"
      sha256 "98d14ebd85f113e1d2f091cfbc2d5742ce814cc36e4fae5924f25c555f7849bd"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Checkmarx/kics/releases/download/v1.4.1/kics_1.4.1_linux_arm64.tar.gz"
      sha256 "b1bbc9660c5642a3914cfc3adda7e9dac2265f8d1057960d6742eb7f515a5dd3"
    end
  end

  def caveats
    <<~EOS
      KICS queries are placed under #{pkgshare}/assets/queries

      To use KICS default queries add KICS_QUERIES_PATH env to your ~/.zshrc or ~/.zprofile:
          "echo 'export KICS_QUERIES_PATH=#{pkgshare}/assets/queries' >> ~/.zshrc"

      usage of CLI flag --queries-path takes precedence.
    EOS
  end

  def install
    pkgshare.mkpath
    cp_r "assets", pkgshare
    bin.install "kics"
  end

  test do
    system "#{bin}/kics version"
  end
end
