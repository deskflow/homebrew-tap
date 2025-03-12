cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.11"
  sha256 arm:   "5977c954e928862c78d971840c9793784b4e3f4025cb409bc90f8775452bfac1", intel: "4543459b6a4eb8f78bfeb390181f07df3319931f27b79644c5948a8c48af5950"

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
