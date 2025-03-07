cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.0"
  sha256 arm:   "51591c444e7316c1f2c6e9a75d9a205938a878141fa1fbe314e79f9ad74de77e", intel: "589156ac8754b97b42323ed2c5605ca19e848cf8f1e070f278dd63b1206e046d"

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
