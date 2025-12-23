cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.99"
  sha256 arm:   "cbd7d6c0e95614fd19782bc1282ceedd4138dce893daf7efa6d9e940736dc5f8", intel: "f7a5e90d599b9ab70b7496e9c431f9318229d2a6b18a35e13124f7973b67ab52"

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
