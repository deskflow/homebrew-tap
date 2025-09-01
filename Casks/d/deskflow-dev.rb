cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.170"
  sha256 arm:   "16859c8192f500a9c026a6f2899f315514084cfe991d0ed0affd36e3649388e4", intel: "ee7637624142d9fb8d1e3fea31b46b883e57ac441c26b7d1540e349d9b9fb93b"

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
