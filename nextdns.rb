# This file was generated by GoReleaser. DO NOT EDIT.
class Nextdns < Formula
  desc "NextDNS DNS/53 to DoH Proxy"
  homepage "https://nextdns.io"
  version "1.8.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/nextdns/nextdns/releases/download/v1.8.0/nextdns_1.8.0_darwin_amd64.tar.gz"
    sha256 "8323fa41c012c58b1ccb04cf54d7feed3f5851e011525b724c30531b0d9ab84a"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nextdns/nextdns/releases/download/v1.8.0/nextdns_1.8.0_linux_amd64.tar.gz"
      sha256 "b7b81dfc67dde8ae363293d3850ed062aee364bb747ff6201353b7c6422903c3"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/nextdns/nextdns/releases/download/v1.8.0/nextdns_1.8.0_linux_arm64.tar.gz"
        sha256 "6e4f8cffc93e2ee8978a288352c8b60455b2f4050d943d814b4a78ec736529aa"
      else
        url "https://github.com/nextdns/nextdns/releases/download/v1.8.0/nextdns_1.8.0_linux_armv6.tar.gz"
        sha256 "f793d0ae10a40fec24823abaf4f917d47cfb78c210fbd6064de4845d4640c11c"
      end
    end
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
