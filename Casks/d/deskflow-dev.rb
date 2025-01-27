cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.152"
  sha256 arm:   "4fcb66077fed8049faf96b7ff2deedbeed95fe8380b3d04465ef0ef0614d60f0", intel: "6bfa395fd1654e2832a86b09a3b86ebe9c5f76f7d0df49e12310652a1553ae08"

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
