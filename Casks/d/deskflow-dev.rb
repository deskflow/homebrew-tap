cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.27"
  sha256 arm:   "3c57f992ffe4a889451b64430da70e43193f409ad19c02dd0e99bbcb540c175c", intel: "5dfa11f59d0af8d7c8c28dd178e32e00acb31a19689571ab5b1b3320762340e7"

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
