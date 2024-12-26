cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.104"
  sha256 arm:   "6165531ab3c41e46c1d6eeaa9468e46e6ad840b996f0506fc6906263765bcf21", intel: "5b0a5c39cb9e4a78f1ee07987851456ddd7d968a558a92770768c8eea8767caa"

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
