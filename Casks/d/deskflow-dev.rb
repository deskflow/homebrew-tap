cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.428"
  sha256 arm:   "4c002e69e081ea7dcb49e8d18a31f4577c8ebb6f4830b84ff6011d3c30b0824d", intel: "fa706bae38fc7e115ea4bfb74c15a5c096ec6c77aea6470dc1ccd2fbc3df96d2"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
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
