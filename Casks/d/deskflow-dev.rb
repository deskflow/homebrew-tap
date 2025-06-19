cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.75"
  sha256 arm:   "9a21fe87063529ff10b4fcd1c483c72019336aa1394a734274828589c097f319", intel: "cdae45ec29d0a6876a8ecdfa13015ccb04dd5daec95544b19fb4c83d5aeac534"

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
