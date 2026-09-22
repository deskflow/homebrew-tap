cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.463"
  sha256 arm:   "0bbd659f75755f2828ee517c2071710afda4bf53630e388db6768ac88d797d12", intel: "11b4c0358922f320ba21ec98ec923dcc26ed853586ebe1274be43f91fe43a958"

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
