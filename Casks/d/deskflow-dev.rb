cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.169"
  sha256 arm:   "2e40e73266482b9f60649d00b266278e8e5d63d6021ec209c2468cb474d86c41", intel: "3d4960c6ffd32ff494479068b8050b7e74f12e751eb140dda5f4bee3b952875b"

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
