cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.5"
  sha256 arm:   "ee75fe73771f3a268013041ebf56a552b40f38552c6b076d129f46f8703f4934", intel: "c7b63d1773dea3b9ae780d3c0189f4b19ef58e55d3b4a5e25aea1758e254d191"

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
