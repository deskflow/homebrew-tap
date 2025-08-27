cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.151"
  sha256 arm:   "bf132950c4b0a928adb62e0947c418f3933459c83d42ade07473afd9c462b17a", intel: "942fe3120d0b0723c8b0ab85c6c8093658e1074cc652367063b1dfe1880da2ef"

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
