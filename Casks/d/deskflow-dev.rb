cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.1.46"
  sha256 arm:   "bd76bafba91269e526fa97a9feefde4d78827ac2d951e1d0732cf297ade03ade", intel: "03bc1728e888827729a3ca895ae8c473b1932a236cae66561c39e738ed6c8696"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
