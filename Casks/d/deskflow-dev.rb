cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.36"
  sha256 arm:   "3bfe9c839e6be94124caa4a5e5aa542dc7ac2459b1d7ec82061a9d2b3ef23988", intel: "172b16c0c69ab9802b38fcf02fb97ab5d221f3effdeefd8b3067915e30667161"

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
