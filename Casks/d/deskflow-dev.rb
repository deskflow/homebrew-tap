cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.160"
  sha256 arm:   "fb14c18d9c27dd4c54da6dcd4b5d6d6bd7566bc34d1b1b5eb9cdc51ba2d29d18", intel: "c1cb6578d7d999f1000f615ac3e1a43b51d28314aca0a55fc6ab048d47f6a921"

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
