cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.0.176"
  sha256 arm:   "4e419934d33f68e6bc9d240e47d1f3b3fd5e716375c8bfc8d996f0045cf9acf5", intel: "35583121c89e9b7ae1fcaf010f982876e49502f828609d0b9c225634c40a7e55"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
