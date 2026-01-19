cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.170"
  sha256 arm:   "ad29b89a342383de7d600def4456c5df333bcda106a53dac2406e3ee0b62f752", intel: "767dfc8bb6a2b1f426e55b643d1581c8df150bcd5f5f2837d31c71f293d985df"

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
