# This file was generated by GoReleaser. DO NOT EDIT.
class Nextdns < Formula
  desc "NextDNS DNS/53 to DoH Proxy"
  homepage "https://nextdns.io"
  version "1.9.4"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/nextdns/nextdns/releases/download/v1.9.4/nextdns_1.9.4_darwin_amd64.tar.gz"
    sha256 "4bf05a31270ed8485741af87285f06ae303a605ee1712f55a4b596a111719f3a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nextdns/nextdns/releases/download/v1.9.4/nextdns_1.9.4_linux_amd64.tar.gz"
    sha256 "71d4f9451daade06f2e62c923295cd351d0e315eb128162f4347040205b6b9f7"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/nextdns/nextdns/releases/download/v1.9.4/nextdns_1.9.4_linux_armv6.tar.gz"
    sha256 "97568d38a57b7faf46c0f7c93b2c14b843f19087cb8c75cb1eae66a80b847d0c"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/nextdns/nextdns/releases/download/v1.9.4/nextdns_1.9.4_linux_arm64.tar.gz"
    sha256 "75c0dcbc999e93de0b4c9700d5477a4e2fee3fe72a78f4d09a2f83e2f610e4d5"
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
