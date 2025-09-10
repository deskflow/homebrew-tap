cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.207"
  sha256 arm:   "1ea1aad47107553248afcc25559ca0f520eb261106eb706cdba9c34bdfd9faa7", intel: "a73d18c167d9b3586687a085fd05175fa2199369f49fdbf3cb3607a78f0c5fca"

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
