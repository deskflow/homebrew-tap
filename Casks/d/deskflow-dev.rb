cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.437"
  sha256 arm:   "a1c1db6bfbc10fd73d98fb5f866a19791e70bc656028ae608388d9053ae7e812", intel: "1eab0e997265e6f460c1c8fa3e60bab81f28b40afd959f672b0db36115bdecdc"

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
