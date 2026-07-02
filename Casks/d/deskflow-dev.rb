cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.297"
  sha256 arm:   "a2c29a3944f54670fb437b2ba3aeab1fdd23f93f3ac152acfc75591bc6d9ef06", intel: "7c1a098aacd23928e22383f004157b1b69ffd5ef3b1ebde10675814ee7a4a0a6"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
