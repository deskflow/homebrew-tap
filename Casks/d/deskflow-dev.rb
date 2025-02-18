cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.60"
  sha256 arm:   "21938a758d1691aa45d486cb8deb9ca967191f7b6cfdd96484506bbfd82583fe", intel: "562a318a1eb266341066c5301e832d77ceca9e600dea148caa5d4f8658f44ab0"

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
