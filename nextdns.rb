# This file was generated by GoReleaser. DO NOT EDIT.
class Nextdns < Formula
  desc "NextDNS DNS/53 to DoH Proxy"
  homepage "https://nextdns.io"
  version "1.9.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/nextdns/nextdns/releases/download/v1.9.0/nextdns_1.9.0_darwin_amd64.tar.gz"
    sha256 "0209a498b30f93e68ec3711b436031279f00e51c7038f77cc1e0d312544ff1f4"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nextdns/nextdns/releases/download/v1.9.0/nextdns_1.9.0_linux_amd64.tar.gz"
    sha256 "7f7e938e4d0d96c5b370455f055eaa4cf3691b836a88ae8dbd2bd721afe8c996"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/nextdns/nextdns/releases/download/v1.9.0/nextdns_1.9.0_linux_armv6.tar.gz"
    sha256 "5b1165ea3405b6ac59fbfa39bc4635e764514dcb80fd68a52ce3c18d93ead197"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/nextdns/nextdns/releases/download/v1.9.0/nextdns_1.9.0_linux_arm64.tar.gz"
    sha256 "0171f0680de161d843b63d2963fe7815e678d8542f5195963f10eeea899a1d2a"
  end

  def install
    bin.install "nextdns"
  end

  def caveats; <<~EOS
    To install NextDNS, run the following command:
    sudo nextdns install --config <your_conf_id>
    Then setup your DNS manually to 127.0.0.1 or by running:
    sudo nextdns activate
  EOS
  end
end
