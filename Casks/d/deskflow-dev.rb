cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.49"
  sha256 arm:   "d93a0d9aa2bf0922f243f528b6753bae2dde0d8f9ec4f1dca77d9883837647f7", intel: "f7431cd93e110ac6d3664cce2cfc45512aea0b3eb9ff4f4cecd5ddb1b09b2ea6"

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
