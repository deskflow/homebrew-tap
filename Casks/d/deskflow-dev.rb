cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.211"
  sha256 arm:   "506977d8f725910c2cfd03b73643dd5e2e07f3def22d50a739bffa02381124f4", intel: "9de243495f25888916512643ea21408a82c2b094c95f7173991dc7cb50c728aa"

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
