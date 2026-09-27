cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.477"
  sha256 arm:   "358ab3c0366161959dcd5e953340b3ce5b703ea66aca68e84efc6cfccb682c9e", intel: "4e569ac285bf698d3762b002b424f37516f3840f0d4b3f5d23ff06009e7eae99"

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
