cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.83"
  sha256 arm:   "02de914ed0d1997f0c180ee65d459e18f1ee7618d87ee06801f193ac956559cc", intel: "3dedaaeaec118aaa3c80a85613bdf1c54cafaaad32deb50874bc465307aa3475"

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
