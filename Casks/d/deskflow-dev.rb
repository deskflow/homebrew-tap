cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.27"
  sha256 arm:   "6760eeed00a7cfe6ce23730d572ecbeebe8054a30d9ae80be92cd308fc30bbbd", intel: "2e0027386348106c4107e6254a488c71ab499c47f7fb39abe93b277171f8f1af"

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
