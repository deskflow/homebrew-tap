cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.365"
  sha256 arm:   "edee05bd85944e1c9cc015903b9b41162e02f31871ac67518be71c49c1ddeb18", intel: "c7b93e03453a52d330ebcb3649298be33028cd2825486557ad41ff39a456c031"

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
