cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.216"
  sha256 arm:   "2043636065c4279274cbe1dedc6c27c4b208470ce8e6e2e3ec95b26c4db5bdeb", intel: "bc505e84cf44105297f03115c580de9c045c870f0100bfcf44191ce68e7337cb"

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
