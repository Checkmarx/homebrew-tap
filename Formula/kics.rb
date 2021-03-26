# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kics < Formula
  desc "Find security vulnerabilities, compliance issues, and infrastructure misconfigurations in your infrastructure-as-code"
  homepage "https://github.com/Checkmarx/kics"
  version "v1.2.1"
  license "Apache"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Checkmarx/kics/releases/download/v1.2.1/kics_v1.2.1_darwin_x64.tar.gz"
    sha256 "3855b326a3253a953bba7a97b99a9f76059a8f51afec937884200dd2055f552f"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Checkmarx/kics/releases/download/v1.2.1/kics_v1.2.1_darwin_arm64.tar.gz"
    sha256 "7b96f01b0770ca103f6d660efed275ae8da37f341a3e5670621c82dde4fe5cab"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Checkmarx/kics/releases/download/v1.2.1/kics_v1.2.1_linux_x64.tar.gz"
    sha256 "7b7e31ab63fba29c8beb87cd29a8b4f2722da613f248b00a91d73bb35db6fa9d"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/Checkmarx/kics/releases/download/v1.2.1/kics_v1.2.1_linux_arm64.tar.gz"
    sha256 "72161c3e447b8bde04c48ac3df10d9391d2a38edaf487599a0485a5c27587507"
  end

  def install
    bin.install "kics"
  end

  test do
    system "#{bin}/kics -v"
  end
end