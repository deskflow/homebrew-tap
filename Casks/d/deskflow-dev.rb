cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.2"
  sha256 arm:   "2fd16aa8e866fc4eefe827098a6a769adeccc8cde69ebef6d33714a822976774", intel: "b346dfab11686b322d53fe2e5618c3d7f85fb08344446cd6f578b5c43da6e6ca"

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
