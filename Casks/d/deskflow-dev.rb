cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.0.26"
  sha256 arm:   "12fbd007f763d935a62666fb0d2dcdf41535e966e5b85397bf7ddf175eef03f0", intel: "40584b6e035fa9a625f6866efae6a72f9b95dadc7e53e4f3199a73a128856f46"

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
