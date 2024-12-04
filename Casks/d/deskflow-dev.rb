cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.50"
  sha256 arm:   "90db541d8cf12e1b0270294c81a1b175d601fd3b2d5efec3c7bb86466e939299", intel: "249f361d835a3a19754a0bd9eb3134658a5ba1968cdaed6acefa3a5db06aaf49"

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
