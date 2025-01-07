cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.24"
  sha256 arm:   "2fd50245d0cc408b2b734ae342e22e5aaac56d0289d453008ac0adf295345900", intel: "d3f5723d3d67c12716e3cc4cf906d15068b328cd80ec5eb46f25f7b7fcb98f07"

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
