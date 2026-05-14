cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.185"
  sha256 arm:   "4710e352e87071d815bf2aea5f7656234fda4b38994a0d75e98ea8c013f69432", intel: "c61fdc2f04080d9b21adfda2b860dad1966e69ae481fac3f3cec56cc5217afc3"

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
