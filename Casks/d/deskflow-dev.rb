cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.478"
  sha256 arm:   "09846ad3b08a124476e5377e3d0b6c292a31f0447bd9e7d7945e91032bdcce9d", intel: "9cf1c7dce26ce8b7d85f33974990a916be3d9f8341d681d2bd502b565255f39a"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

  app "Deskflow.app"

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
