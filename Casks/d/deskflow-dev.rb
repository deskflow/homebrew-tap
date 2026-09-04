cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.431"
  sha256 arm:   "849e787d31bf5e3684b727970f1dd5ea97ffd75aeb9e777c5a64448b2799e558", intel: "31f36520f74aab34cd0ed13af84897563417a76da0db0e20e75e5ae6525ab19e"

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
