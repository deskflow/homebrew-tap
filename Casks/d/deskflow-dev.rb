cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.13"
  sha256 arm:   "36697dff7b0b45e1fc1b8e46a7b67b2e0b61a1ced5a63c0daca9e0b3566b98f3", intel: "d78ac4cdeec1c575ad0c258e429a2c4b7a8ce83625fdcf2b37033dbfbfc407cb"

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
