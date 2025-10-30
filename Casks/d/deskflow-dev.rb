cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.184"
  sha256 arm:   "e7e70c41fca4e549919a52d3fb66a6036c7d2593e0bd873f6ad5d98cf55a525f", intel: "9f529299f7d08111c7fc81dce4806f2156f7a71379b1b1824b6e89b11155ddb8"

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
