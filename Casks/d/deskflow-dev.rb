cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.58"
  sha256 arm:   "0cf67da013a996c5cadec0ac7182cc302d84fc54dae6b22612cb13672dd1c923", intel: "e47c30bf9936455f31f5804215b4ed5cd65edc4acb62e652583092ae9534b6c3"

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
