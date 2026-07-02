cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.298"
  sha256 arm:   "b3e3ba6cd316bcf1eb9006ce92cccca26114a4d76b0b981488676a85c74abdfb", intel: "b87edf9ec331ff166d38ca19d8b28e5febf3ac9f0657e6aab131740f69a14561"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

  app "Deskflow.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
