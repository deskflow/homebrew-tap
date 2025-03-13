cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.24"
  sha256 arm:   "4e0a74df8454be4d3dc66390a1bbff605b4309fe5b231d112375fa283e79af11", intel: "7544794f92fb7b8e328aaf4bd63336c0c4ff3c4c443df687ab0a7a7c49837efa"

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
