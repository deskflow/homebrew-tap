cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.8"
  sha256 arm:   "687efb2a35bd2dfacafbead6a3004118cf6281858548fcaa0f19aa333fc6e966", intel: "9ffc80ae7b27809ca4303819a7ac907b57a9501b08eedbbdd392659bec18d82a"

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
