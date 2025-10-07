cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.73"
  sha256 arm:   "4ddca523c2a7b146cd82826b95c80ad807a3f3d9930eef698d2daf263db8740d", intel: "5865237b71c2c1729fb2c0408d261199191be659ba79fe8e3c74b5aa8b5004c5"

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
