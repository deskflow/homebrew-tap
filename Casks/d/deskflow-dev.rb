cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.22"
  sha256 arm:   "2163192b874de5dae2d76de6ba547d4af1bd35944ae46a4b74ad4f2bd35ac19e", intel: "5c01ba64c95ef97376992c11ed6181aa0e00e3dd23f1b95fd487f7cc43e2090d"

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
