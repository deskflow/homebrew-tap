cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.152"
  sha256 arm:   "d2dbefd5aaf2b0708670905122f8ff866fc7e3fc4bef3fbabd1eb73fb3a9cddc", intel: "b11ddf2a74133283be526954d25a429ccf2a27c839cfe686d19eb1a9bea86161"

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
