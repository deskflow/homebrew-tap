cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.162"
  sha256 arm:   "2522c3d0ff796451daa6d6ac76dc90822d38e6bd7bcbd555fce6d0f18bfb3acb", intel: "bfe35059b6972eadeef5c58c75c74b8d66ba2deba3f2de29e4ffc73444cd9492"

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
