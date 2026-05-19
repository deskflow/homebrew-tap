cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.202"
  sha256 arm:   "888adb2fece652186dd16641313437a8733558816fee0fc49555a0a68ac4e29f", intel: "609e9e1ef53d2f45aa638e079176123dfeaa480a42d117facaf8f23c5742f051"

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
