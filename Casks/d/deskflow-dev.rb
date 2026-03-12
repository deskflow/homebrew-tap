cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.83"
  sha256 arm:   "48b96041d92423a842f5de53910cb31ef28fc44ffd8cd9f376e5857c506e97a0", intel: "d9c01eb695b3f19025fbdb808982a2e562f6211719f2622b3a50470756dddaeb"

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
