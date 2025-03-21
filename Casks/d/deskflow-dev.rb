cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.179"
  sha256 arm:   "330eedbb8862beed9e17b4d95b4b95b22bb2f669bfab6d4444ec8f9c4dd55b16", intel: "97f97ca4419c8b9e32f0cae841048ecba52f367bcbd634732f65090a066b7c96"

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
