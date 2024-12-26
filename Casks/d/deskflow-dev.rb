cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.113"
  sha256 arm:   "f881181dd052887b5406dc137f44076541331e60909df63fb20e797ea3db76ac", intel: "5e040bccd03e26a2eab1a3ba8e8d3d393802823e95f91f9903f30d7c47abcb03"

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
