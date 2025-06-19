cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.72"
  sha256 arm:   "c93e5d767b9ec15ed4373669795e48be56e9fc2b9550bdd27ad61328f0eedcb0", intel: "0dc543c48e8f242a46c662c2e6a824f5b163cac831ecafd4ff1de86436520f92"

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
