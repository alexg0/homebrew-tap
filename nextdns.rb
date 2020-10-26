# This file was generated by GoReleaser. DO NOT EDIT.
class Nextdns < Formula
  desc "NextDNS DNS/53 to DoH Proxy"
  homepage "https://nextdns.io"
  version "1.8.8"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/nextdns/nextdns/releases/download/v1.8.8/nextdns_1.8.8_darwin_amd64.tar.gz"
    sha256 "55f277eb9c029d98396f6d296d922575f1ae20e32d2b2d26465bf75aca77724a"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nextdns/nextdns/releases/download/v1.8.8/nextdns_1.8.8_linux_amd64.tar.gz"
      sha256 "6ca026dd2f7f6b92db61bd88c3c4697b7008c25cfdee655ec330a83563ca369b"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/nextdns/nextdns/releases/download/v1.8.8/nextdns_1.8.8_linux_arm64.tar.gz"
        sha256 "7ba548bf49eb86ef439c320269b9e3af56002860cd32603cb5cb01f75eb8b091"
      else
        url "https://github.com/nextdns/nextdns/releases/download/v1.8.8/nextdns_1.8.8_linux_armv6.tar.gz"
        sha256 "c3c1baa8e1d21205a925f572eb1aa904bd48de8b8834e12c8c7820559dce9af3"
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
