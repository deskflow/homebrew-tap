cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.1.22"
  sha256 arm:   "bbd2d9f91f6158005bee8c8c6ccb836d47762b92f2a4f10f129743c18dab0f1e", intel: "1af9f67672dab8ccb6fb4891fbb3983a8d82ab9a0c1896fbab50bc45ffc831b6"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
