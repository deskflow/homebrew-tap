cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.29"
  sha256 arm:   "b50d30d97c596ba2d42fc95cd1316bd2657a40c6b6fa0d7c2806338211c5e401", intel: "7d5d215bdfd7c4de2a8822e6147a8e0a80454c825d3999c6ecebd0cbe1799b61"

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
