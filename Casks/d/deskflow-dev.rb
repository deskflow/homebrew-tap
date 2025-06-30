cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.116"
  sha256 arm:   "efb44e1c650acbea4019690ece779adfa9ec03abc7e20003e5ecd2769540e558", intel: "f6fb67a916a423d4a92f34a5d34c42349f3b3520bbd04185a8dc568a2b73df50"

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
