cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.178"
  sha256 arm:   "da317ee9f8681bf791d8eb66621b3f7ae4a9c442c01dd45daaa296e915969c14", intel: "7e441563c32645b7400cb7e51146b858dff2d615fca5c32a39cbda7c99d05ded"

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
