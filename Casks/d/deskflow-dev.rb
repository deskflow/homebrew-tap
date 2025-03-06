cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.0.18"
  sha256 arm:   "3f8b44e32483d913e4daf1b7c53de66247bb484f39841fa164edd05cb15b3c43", intel: "e517f680427cb5ee31b1fcb8c4ee48260b71c5123bd972c48248beb3a0a88687"

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
