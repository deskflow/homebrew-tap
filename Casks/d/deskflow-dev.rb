cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.162"
  sha256 arm:   "196bc0f74280dc2ccb9bf5cc3f1f30d38a269339ad577f71d373f4a16fc496de", intel: "12b577e239b6ad4307a405749e1803a127b663ea5fd3b3ffc6be050e89de2995"

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
