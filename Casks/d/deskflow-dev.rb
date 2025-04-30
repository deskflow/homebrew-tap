cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.95"
  sha256 arm:   "6d620f78df75f9b0d23f41b08f34ff7f869549844089ee30368ed2c602b41f19", intel: "503df6a247f03fc436f529cb42eb38cc37709af562f237619a8ed872e6d8f384"

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
