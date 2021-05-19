# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kics < Formula
  desc "Find security vulnerabilities, compliance issues, and infrastructure misconfigurations in your IaC"
  homepage "https://github.com/Checkmarx/kics"
  version "1.3.1"
  license "Apache"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Checkmarx/kics/releases/download/v1.3.1/kics_1.3.1_darwin_x64.tar.gz"
    sha256 "7d29026ee38bfa331c38f332f47cc6796a7f874f40d2bb453ed51b372b71b41b"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Checkmarx/kics/releases/download/v1.3.1/kics_1.3.1_darwin_arm64.tar.gz"
    sha256 "499b432ca2a1d5750e6f57ddb31b1cd0877fe8e1ee2aad05c10a6bda1b457f78"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Checkmarx/kics/releases/download/v1.3.1/kics_1.3.1_linux_x64.tar.gz"
    sha256 "657b945419706612a1700573785dea8f663f96f13f9ca3d2f45b27880ea4a332"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/Checkmarx/kics/releases/download/v1.3.1/kics_1.3.1_linux_arm64.tar.gz"
    sha256 "b2a72a8467616103a2cf4deeb7c66757d19fccc8e617b6bea6974ba1f3f70674"
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
