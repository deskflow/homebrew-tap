cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.0.7"
  sha256 arm:   "d7d27a6511e3a618ef0ddc2d5d20a15d75cc144db6ac78457c6990e29c43beef", intel: "7cebda1ec0038c2fe544375198693192b697fd18e2244c12c7c43c0e22b74387"

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
