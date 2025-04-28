cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.43"
  sha256 arm:   "44665304854a2522993379b9e5f1e5d1d6b5689e57910b1bee96b0f097775b34", intel: "eee1d9f9081c38041ecd33bd48c701504b98f4adf9c640125349c11f7797e8d1"

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
