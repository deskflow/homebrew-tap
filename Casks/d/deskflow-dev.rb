cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.415"
  sha256 arm:   "e297a444f44ef0ceecae18e2925ddaf4338cbb334f060c60a4ed417c1619c0df", intel: "ecd865d94aec04632b87b390bb4873fa625840cfc8d7e412e841aeca72952a75"

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
