cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.37"
  sha256 arm:   "1b7209c2341670a7cf0826a37ce98bfedd60d4b1bda1344053d32a3aec1163e3", intel: "6726a3d6804d7509e69a0aa992aad589d3214f87cfb85cf2aa8bb0a811cae988"

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
