cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.164"
  sha256 arm:   "a0f71d11c32785b301f7a0e38023bf1d9caf9bf5d3a2dacfea2742c1bee44733", intel: "02f65b90caa0e52c21e0b15c1188b2f18dc2d84f3c012c3bf58756ba0f23d114"

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
