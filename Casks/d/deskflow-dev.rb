cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.0"
  sha256 arm:   "fbafad509a352a3bd0fd201d5c81646cc6162d397a9b9f3d970940714e160e0e", intel: "52274ee8285f94d396265efed8e8c51d7351fad6c218c98228b00fe9368a43d5"

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
