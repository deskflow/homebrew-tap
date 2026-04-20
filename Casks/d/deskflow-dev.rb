cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.145"
  sha256 arm:   "8869e34876f8e2f6b1e40819bab570de16de4ccabe89c2cdc25576075ec0d21e", intel: "11500ccd09834e9f621554a0705b16dd28cfdd1dd9b017c80a4c5b00f7f33421"

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
