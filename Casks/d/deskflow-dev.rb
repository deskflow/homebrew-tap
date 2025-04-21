cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.19"
  sha256 arm:   "eb0cf66ed390fc16ea50a488b33a304b2e32848c5033b1ad191c1c89692751d9", intel: "f040d43d75b7514b2c8ca38d47ae0f9b121b4981937c31b51c24ad0ae95e9af8"

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
