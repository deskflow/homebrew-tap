cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.429"
  sha256 arm:   "93829190b1566e6dca4271ede76d5b1c6cd04c069fb2796d0b46f1b79b5da235", intel: "2ff9afa779cfae0e974b6b23afbe30258339ee0b219c8071a99e5d2eb355ee25"

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
