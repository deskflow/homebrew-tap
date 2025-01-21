cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.138"
  sha256 arm:   "b9bedaa39a760260fb8cebca518d121f3cc885400afd5cbe3dedbd607bd768a5", intel: "f38828171ad936aa6ac03bda98aa5a58292dbe8973750845d88fe202890c4db0"

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
