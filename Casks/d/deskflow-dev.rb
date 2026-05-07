cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.176"
  sha256 arm:   "7cb8c5f51651621b30a9f52ccb52ba41971043211fbdf522c091e403321ed1f2", intel: "849b76900d2ca6ad5f64a5f74fb3d9622afd2882ce8634f9e0592d0e2f3141b0"

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
