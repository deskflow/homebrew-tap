cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.49"
  sha256 arm:   "0a7134b7e607438dd3178e9d6b0c7dec5574ecc0d84bf4b2230ea1e035cff876", intel: "fd81b9d7ae6d8d5aef27b6b2573fabc63eaddcbfe4e9e84088f24aa3a71391d5"

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
