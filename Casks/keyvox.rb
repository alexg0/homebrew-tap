# frozen_string_literal: true

cask "keyvox" do
  version "1.3.14"
  sha256 "90cb9714d864445c6a373ea7922aaf08c516b727de230cdbf37ee7e32b9448ec"

  url "https://github.com/macmixing/keyvox/releases/download/v#{version}/KeyVox-#{version}.dmg"
  name "KeyVox"
  desc "Local-first dictation with on-device speech recognition"
  homepage "https://github.com/macmixing/keyvox"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  # Homebrew dependencies use major macOS releases; the app requires Ventura 13.5+.
  depends_on macos: :ventura

  app "KeyVox.app"

  zap trash: [
    "~/Library/Application Support/KeyVox",
    "~/Library/Preferences/com.cueit.keyvox.plist",
  ]
end
