cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.470"
  sha256 arm:   "6679a593a54cc0862ad4646bfee659f576aafa96c4bf508a9ee0f2b2dc702392", intel: "caacc19d11f05085ddaf0645f3b5f6e522dccb8747f175f0abf47c0322da7858"

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
