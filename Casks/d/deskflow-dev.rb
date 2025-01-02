cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.5"
  sha256 arm:   "ad83c271bee99310de4070c9b7dd985b03c28e2c2680b671975566d3075b39d3", intel: "0192bdddbe59527ececfbd8aa4ef011afa1b8b132a262123a5d6c4cd46621bb8"

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
