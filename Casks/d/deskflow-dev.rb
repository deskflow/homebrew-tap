cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.7"
  sha256 arm:   "dad88bbd2bc3c570e630bbf8154dff634dd9ed09ab3c588dcb39ec135ffb51b1", intel: "90e52dfc316dec9381c00505ac1104babe9a0f3d561ddb2b2658da32e0e6bb10"

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
