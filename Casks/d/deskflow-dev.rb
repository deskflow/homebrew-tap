cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.427"
  sha256 arm:   "c5c9c7f2f576804b6a3a6d14e817259448454f0b59f3613fe6431fba5e39386d", intel: "56b0ceff470c47d025dd5d8e6764931ba96ce2adcb11bba51b60faa9589f5fb1"

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
