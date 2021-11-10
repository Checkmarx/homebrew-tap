# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kics < Formula
  desc "Find security vulnerabilities, compliance issues, and infrastructure misconfigurations in your IaC"
  homepage "https://github.com/Checkmarx/kics"
  version "1.4.7"
  license "Apache"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Checkmarx/kics/releases/download/v1.4.7/kics_1.4.7_darwin_arm64.tar.gz"
      sha256 "8d927b7773fa71a7548137ec24e0a0d2956e642a0bf0c23e6803f04cd381ef61"

      def install
        pkgshare.mkpath
        cp_r "assets", pkgshare
        bin.install "kics"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/Checkmarx/kics/releases/download/v1.4.7/kics_1.4.7_darwin_x64.tar.gz"
      sha256 "5c7031ebbf49473e70818bece0c768e898751c5459e95280db7bd53b0d8ab28c"

      def install
        pkgshare.mkpath
        cp_r "assets", pkgshare
        bin.install "kics"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Checkmarx/kics/releases/download/v1.4.7/kics_1.4.7_linux_x64.tar.gz"
      sha256 "bab28ab371c6d1873a31279ebe8eb5fcdda39d048fcb8a68919c095f359393da"

      def install
        pkgshare.mkpath
        cp_r "assets", pkgshare
        bin.install "kics"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Checkmarx/kics/releases/download/v1.4.7/kics_1.4.7_linux_arm64.tar.gz"
      sha256 "224d8039c6c870204faa02a781a539109b86d26488055b1e9cbf9492c5431bdf"

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
