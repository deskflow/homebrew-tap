cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.73"
  sha256 arm:   "7cf82e39475b9936a96ee51bbd6efe56d18e998d1919f1ffebda4d695f6536af", intel: "7b79f3ca4e3336a59e466dd0cab29ec0965686415b7ef3fcfe3bf8422e96ab37"

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
