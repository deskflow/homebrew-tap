cask "deskflow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0"
  sha256 arm:   "dd21e79e566314394214906d3338c505d337af536fc580c022ee3fadffad0c97", intel: "8aca3c77a1b16b9a3d6b8a380e5e38a0e6abf6d241bb32dcf3cf8b67abbff5d8"

  url "https://github.com/deskflow/deskflow/releases/download/v#{version}/deskflow-#{version}-macos-#{arch}.dmg"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow-dev"

  depends_on macos: :monterey

  app "Deskflow.app"

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
