cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.63"
  sha256 arm:   "e804ad867600bad2609b289db05e7f48ee6021cb4bb03fcdf701d15907af96be", intel: "a31239ae5083b048e14c9a898d73a4dcd4ecae5bcbd0bd7a9c22e9284f0b493f"

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
