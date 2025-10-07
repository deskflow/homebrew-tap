cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.72"
  sha256 arm:   "20c99aa31b9cbed5c7b297832afc82765b31a6624bd2adc005ff84fab505e628", intel: "56479422e40193f8faa2c5d35b21a537dfe7c0414d19e18d6039338892aeb733"

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
