cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.1"
  sha256 arm:   "f69f0c4e182eb9b132b8fd926c8c1cd918f2ee82009065892bccf594061fc973", intel: "d6841aa48b1eefa7f3537bace9f3c17fe61a65178068bfc2bacd78771959813d"

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
