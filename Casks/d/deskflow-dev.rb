cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.105"
  sha256 arm:   "3a11cd52b76b6fc2d24a4b3db00690a7a5cfa68505adb51973ad8724afd86d98", intel: "9e515f12115084e6b30f52ca34b626aa4dbfad2c9f3814832e8a2bc4ae4fd21e"

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
