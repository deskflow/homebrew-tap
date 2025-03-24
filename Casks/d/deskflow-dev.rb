cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.183"
  sha256 arm:   "ecf173fa748aad7d141a8cbce5a2b0f65991da7abb034776cbe028dcb2bd8321", intel: "eaeb254ea25d26c1786e829af98fea3e7728e26bc40e71017999106d4415b841"

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
