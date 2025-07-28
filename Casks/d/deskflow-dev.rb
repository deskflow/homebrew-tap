cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.1"
  sha256 arm:   "dc1b5c94e74186356b4dae2323c2286ab53ca066a9656987d40eda5c9b25670c", intel: "7b3d87fe122f394e1982903aff9f00fbf8e0955c0b98a388fac1a3af88643500"

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
