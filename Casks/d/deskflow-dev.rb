cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.136"
  sha256 arm:   "33c38685b10e6442a8f6a666bfcc8f7acce33412c5aa2d03a73e07ce4917c252", intel: "aed1c1c21863e5e04c3589dde3af612efbd42ddefe863ba86c4ecf3f71645278"

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
