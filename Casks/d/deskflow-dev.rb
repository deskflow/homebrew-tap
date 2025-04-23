cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.26"
  sha256 arm:   "29625e89374de01a13d216613c019a7dc322e41dae9c6688927d10ac747744e1", intel: "fb5a6d36329d1236349d0bb6bb43a5099d95e60a008323f5323856e8409525d9"

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
