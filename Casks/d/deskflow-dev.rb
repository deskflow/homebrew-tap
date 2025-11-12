cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.336"
  sha256 arm:   "0af61e8c39de6d794792dc70ecd79389201c3be34333497ee174bb037408828f", intel: "b07f740b5912f10c278684ff41c8748a299ad76c02a0ac57b813e7d5b4c90533"

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
