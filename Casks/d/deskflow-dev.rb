cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.1.27"
  sha256 arm:   "af361860f893efbc1cb4ad67196e8bf1f6bb406a08a8c0145fa279dfbc2b26be", intel: "a1e27d38be0cd6646344b5f84429e9690b22c9a3273a7ec8b72e707c7175a009"

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
