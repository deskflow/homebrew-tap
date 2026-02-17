cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.10"
  sha256 arm:   "27ac1e4d498b34f3d25a469e1b2aab17ea38e54a34b3543f700ba0bceb3cf949", intel: "43adb2c03e06c0efe5ebe140ea18c740ecf5cc7847cad22fd1d6b3295f21deec"

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
