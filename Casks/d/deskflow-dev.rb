cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.176"
  sha256 arm:   "0421eef8e06aa6daceaabc728ef99d7db01b14a0f08f8b9dbc9c9f7decb92885", intel: "aa837bcbdaf5bcbfaa7264f0509f6e22fc0ed6205e739e6293750fe771acaa6b"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: ">= :monterey"

  app "Deskflow.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
