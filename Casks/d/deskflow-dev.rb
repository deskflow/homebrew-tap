cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.266"
  sha256 arm:   "c5631e4bdca5bac41291bca0034dfec3b6c35f607195d7e896fffd7e653949b3", intel: "c2885f2e5dc7b796713e7a0d6cddf6821575665f77686e111425f2616a7e3220"

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
