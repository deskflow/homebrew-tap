cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.80"
  sha256 arm:   "de53933e37c62b51be98fe8ded3d2f0628c929d9a00dbb97a8374b930d49ef40", intel: "d345d8ab4d33cf6ce69ef275248c26850573e55a997606ac4eaa5920c8a69393"

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
