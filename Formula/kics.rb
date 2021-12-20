# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kics < Formula
  desc "Find security vulnerabilities, compliance issues, and infrastructure misconfigurations in your IaC"
  homepage "https://github.com/Checkmarx/kics"
  version "1.4.9"
  license "Apache"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Checkmarx/kics/releases/download/v1.4.9/kics_1.4.9_darwin_arm64.tar.gz"
      sha256 "573d31a4be538884c189c737aa9f4b007722b923d9f16e263858f4a88c40f0ae"

      def install
        pkgshare.mkpath
        cp_r "assets", pkgshare
        bin.install "kics"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/Checkmarx/kics/releases/download/v1.4.9/kics_1.4.9_darwin_x64.tar.gz"
      sha256 "b528f3a205d2a0ae1929449befd09246b5eb21ad35f252d51c9453f2bf6f7962"

      def install
        pkgshare.mkpath
        cp_r "assets", pkgshare
        bin.install "kics"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Checkmarx/kics/releases/download/v1.4.9/kics_1.4.9_linux_arm64.tar.gz"
      sha256 "31ec4a7e3c5cad12964f6231189447a7e0618b76586214c99c396cf625ecb6d6"

      def install
        pkgshare.mkpath
        cp_r "assets", pkgshare
        bin.install "kics"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/Checkmarx/kics/releases/download/v1.4.9/kics_1.4.9_linux_x64.tar.gz"
      sha256 "6d0c0e165cf46521b610eff90c7cbda6b55d26876b592a52e3a687792f23204f"

      def install
        pkgshare.mkpath
        cp_r "assets", pkgshare
        bin.install "kics"
      end
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

  test do
    system "#{bin}/kics version"
  end
end
