cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.21"
  sha256 arm:   "46c412826d6130adb121de3dce20382b42b13ffa98b3af05c4a627c204875e0a", intel: "a56ae2f13a65438c5629cb9c260218f292d7747095b8f58ceafe4f21c38539e8"

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
