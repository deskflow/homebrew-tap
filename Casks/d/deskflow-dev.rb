cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.247"
  sha256 arm:   "04aafd45e1c824e86ca823e486c443cdfaf4eb7243dc135420321897078c4d10", intel: "be13ada8b0f641f28904c44e6e9cee5d96bc6b570e7db903d18527dd874138f4"

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
