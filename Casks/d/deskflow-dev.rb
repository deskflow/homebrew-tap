cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.185"
  sha256 arm:   "a315f46c51b4ab3602e8a2b218d6dcc989c8e3f7b116ac9db7fc2edc5af31c84", intel: "7bcddfe7494d3dd910646eb0f206f5e0b9af49e594787f747aca3d9a7e9cf24b"

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
