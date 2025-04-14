cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.8"
  sha256 arm:   "6266215a11994721ac403b365824122b140b01526a52ef60405d7043d28d79d9", intel: "6569ccdbf86f5170edf98494f40585504605afec780ee84cf5bc40987bdff88d"

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
