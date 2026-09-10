cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.434"
  sha256 arm:   "1df30ad1f36a32b11aa93931c144a9f66781f7523ab53bd74da164aa05c6aa10", intel: "94c3e2035b9b1508b249d3ac1328d1c14b947f90f3bcfd67b26f1ce50e4d59dd"

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
