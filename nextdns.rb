# This file was generated by GoReleaser. DO NOT EDIT.
class Nextdns < Formula
  desc "NextDNS DNS/53 to DoH Proxy"
  homepage "https://nextdns.io"
  version "1.5.4"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/nextdns/nextdns/releases/download/v1.5.4/nextdns_1.5.4_darwin_amd64.tar.gz"
    sha256 "5c5c1cf7c2a15a0e06f84a320e6ac273ac5861472e476a713291787c269a62ea"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nextdns/nextdns/releases/download/v1.5.4/nextdns_1.5.4_linux_amd64.tar.gz"
      sha256 "3900cb278aef00a7e6a0f59fd9eee2900c3ac464ded64ab78e1d67551ee0e968"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/nextdns/nextdns/releases/download/v1.5.4/nextdns_1.5.4_linux_arm64.tar.gz"
        sha256 "45f31e4f1b2cbcfeb85bc97e734316f41ab06acb5e493764170026988d00574a"
      else
        url "https://github.com/nextdns/nextdns/releases/download/v1.5.4/nextdns_1.5.4_linux_armv6.tar.gz"
        sha256 "2c4fab359aec2d4c8d1ca7c5696484cbd4c34407a1d54f3f43f12e2dd3b48b00"
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
