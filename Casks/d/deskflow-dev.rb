cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.272"
  sha256 arm:   "1ae7990674dc1dcf539dfc73a8e5686ee3c92554f16b76d39e95cc4279e4f5e4", intel: "0dc9bed2479320bcef7ac0614ca7ac7b3bd7295a3bef1fb0710f845e763e1d56"

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
