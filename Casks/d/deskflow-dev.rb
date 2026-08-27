cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.418"
  sha256 arm:   "5a9e496b6aa227a2ce38cb44b650c99074c2da1ce5ab54ab46179074a3455515", intel: "74a75cb9533068ce297f278a615727103a1c20570f0f9c74a4d5322dd89e3875"

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
