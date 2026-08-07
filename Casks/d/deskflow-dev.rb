cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.365"
  sha256 arm:   "c98b70557bae56f679c8f1e853088d27ad36e068d70cb90c2ffd08e73b9149a6", intel: "739e42052da293f8f1e39bb869e58bfa52b2a29089c0a9d2d42a4f61cab48e34"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
