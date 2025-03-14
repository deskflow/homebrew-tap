cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.88"
  sha256 arm:   "c40f23b64d8609e54fce3827a3d81f1dcece97a6cecdf0bcb8a420ac52a8cf8a", intel: "7d4ae0e7523e618c6e7effd9a70cdc3f989871ff9724f87b92f6454fc5c6d26c"

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
