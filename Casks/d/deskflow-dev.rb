cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.55"
  sha256 arm:   "e524f01060bb55aec02c60a1aa690013962ba9b452ec9e11c71d1398a89277e3", intel: "96d1a773eecfdadfaf8efb8ea7cc5034cc283f6c21cbe9273ca607b8a4f3de77"

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
