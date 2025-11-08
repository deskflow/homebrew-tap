cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.320"
  sha256 arm:   "b5c23c5eeb3d805623f2702c8f2799828dded062ad66fcc1229dba5acdb50cb7", intel: "3ca50f28175b350309591b0470dfd4048a587a5ab950ae3744dc6081dba75e01"

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
