cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.193"
  sha256 arm:   "c058f2e23365759fe60726889f2f4ed9cbabae60fa705181bf43754717664c80", intel: "ec8f37e87d0a1399b2de302f708d78b1f2f3bf9b54fb2f1d5d5fcbcf11bd96a0"

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
