# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kics < Formula
  desc "Find security vulnerabilities, compliance issues, and infrastructure misconfigurations in your IaC"
  homepage "https://github.com/Checkmarx/kics"
  version "1.3.3"
  license "Apache"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Checkmarx/kics/releases/download/v1.3.3/kics_1.3.3_darwin_x64.tar.gz"
      sha256 "3bed79df8c8d0ba6017fc8e23ec3010c82c6b8041dd06c1a8cd477cb6aa0c12a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Checkmarx/kics/releases/download/v1.3.3/kics_1.3.3_darwin_arm64.tar.gz"
      sha256 "c19cdf8cf65aaf255c2c75d0aa94c1f6541a097aee3f05b0e2b65e9d3e0d435f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Checkmarx/kics/releases/download/v1.3.3/kics_1.3.3_linux_x64.tar.gz"
      sha256 "6137139ace7f95be4b98858ae1abb7793a6b5f340eb434610ef9f20a7e8fb20a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Checkmarx/kics/releases/download/v1.3.3/kics_1.3.3_linux_arm64.tar.gz"
      sha256 "2a96412ab81bb7e76bc26abab6cfca871139eec6b6757bed9ed1f1fd422858a8"
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
