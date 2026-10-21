cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.16"
  sha256 arm:   "3abfdf246a62783a4b63bd1c514eb490eaaf508e781af5b45a57c81c88932644", intel: "b3a422e48a6b7ec06b7e656c9d7035e2acf3fc2cf005a86c08064698b660ac26"

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
