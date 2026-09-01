cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.426"
  sha256 arm:   "626eeefcf7256f8a7cc728bf588c137a9a239b44233c225b70c71824a84f78d6", intel: "1f0891662738c841a3f99c8f96e8a56c1cdbc94d9dc2c8d2b952c29ea6afd0b0"

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
