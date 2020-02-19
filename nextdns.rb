# This file was generated by GoReleaser. DO NOT EDIT.
class Nextdns < Formula
  desc "NextDNS DNS/53 to DoH Proxy"
  homepage "https://nextdns.io"
  version "1.4.33"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/nextdns/nextdns/releases/download/v1.4.33/nextdns_1.4.33_darwin_amd64.tar.gz"
    sha256 "f316828afc55cccd220981c36d7bb9e33272fafa2b9511e1d0aa9c311c95965e"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/nextdns/nextdns/releases/download/v1.4.33/nextdns_1.4.33_linux_amd64.tar.gz"
      sha256 "7f9cf1e8a3d4de10fcac19386b3ef33070cf4272672d0ce41cfc4a1312b42488"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/nextdns/nextdns/releases/download/v1.4.33/nextdns_1.4.33_linux_arm64.tar.gz"
        sha256 "9655417cf3c68fd6ddeb3d6876a2e10097d84ed66d3569f0bd7387e25657f971"
      else
        url "https://github.com/nextdns/nextdns/releases/download/v1.4.33/nextdns_1.4.33_linux_armv6.tar.gz"
        sha256 "04ad2636f940139bbdd92fe85c461cbe37d61669ad386e19ac89180a83276b9f"
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
