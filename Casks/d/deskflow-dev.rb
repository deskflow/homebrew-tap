cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.170"
  sha256 arm:   "06b8b4ae1f8cb1f7208cc5dc421e5345b629d4d653b688ccd752b71ea0e2d3ac", intel: "8c49f0b5ff98e056a43ac7dad5bec82c1f88b6470e9b0d5cf0e1492e70e74ef7"

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
