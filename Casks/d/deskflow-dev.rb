cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.51"
  sha256 arm:   "a6c42fd507c429dc2613a4620758002d48b61c01de31f2082c5f7e21e73638fe", intel: "082c861c8438232b54f2b4ea45f1992080152fdf10640c41c8ff585d11205a8a"

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
