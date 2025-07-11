cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.175"
  sha256 arm:   "a0c72152f7a76cbc851c835cc7c97d0abf264223b382e007246a728194d6bd7b", intel: "428a1945282f4767c5f3539faed151d426bd16071a6c4512cbf39f9f93520556"

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
