cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.483"
  sha256 arm:   "2fc52c52cf349e6e1a38f08a1d367922d175fdb413305d290f7486f41788e391", intel: "f9746c575d93417c5ebc8bc7ab0618d9c838856f2b96bf53ef2f46db0af010f7"

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
