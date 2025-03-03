cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.187"
  sha256 arm:   "9c9fec5d76ca4fa6c822b0837c17185335039443cf0a3f787f2ec645214f9c8c", intel: "7dd3fa5949dfd1bb6e1f6144a340f04fbb76e753625af8b5949b1ae5ba375bc9"

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
