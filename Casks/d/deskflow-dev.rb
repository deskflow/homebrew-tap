cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.5"
  sha256 arm:   "4ecc681da0761607fa8ab0d4e762d10268408fce32e1b5019ad45925ac1115c9", intel: "d53cea548de87156971a293d898022d9091e609547af5c9c1059f04db966a263"

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
