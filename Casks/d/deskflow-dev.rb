cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.432"
  sha256 arm:   "fa799e88fb3309b168b9fe3301a097ec7baf6ee83ad22484a14d116511eaaafb", intel: "99a109ec5dcab52639943a8ec77d7cc68d7ec2cf8e3a33e67a8cf83a89a840e7"

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
