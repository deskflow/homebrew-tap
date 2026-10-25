cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.19"
  sha256 arm:   "f0b14f174435422c6506cd2a472bc2b27e90d28ef79bc9a49ad868fc73dc6d20", intel: "834f69c39ee5a5d0100fc6a0ae8a1d9f27964118613035aab05096ede5eb2679"

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
