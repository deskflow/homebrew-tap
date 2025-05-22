cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.261"
  sha256 arm:   "4779aafa8c3e9d75bdcf86e76e14adee219e926a2d16d64a360900f4ffd29334", intel: "386c8a03329724dd8dfb1c31776165bedc1948b11cf82fc2daf6631b3942a7ef"

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
