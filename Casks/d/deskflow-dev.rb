cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.155"
  sha256 arm:   "7cf259e209d5992ca278eb03692754def502b1e311dc6c284db590e4d6c9f5fc", intel: "291af90dca5d60358026a1d233c502f924c3b1a1db0ce516b68ed38c2d641d0f"

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
