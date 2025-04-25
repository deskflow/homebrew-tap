cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.32"
  sha256 arm:   "e583ff6100ce91ac4a4d2c0bc413d9c3778a477ed496c8b9bfc05db3ab1f043a", intel: "547e13d91ec3685324fc2d32358ec26bed94ec3cacbef4a2e01bf969a2936a50"

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
