cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.10"
  sha256 arm:   "0a80702011cf1a3a9fedb2a1cb1fd962b748e62fabf09c24f9b7d639093b3eee", intel: "c86fb53f8770f1668a1b744417a494caeea1136485042afe569c1a5cfa6906ac"

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
