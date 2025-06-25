cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.104"
  sha256 arm:   "bf0126ae8df317381815386b948ad5d2cad3af4473c77e92a8aca3d51f248139", intel: "e5f8596c50f0b29e673f462c8b3e44c8a09e14fabc03dc19c82b87454c273a13"

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
