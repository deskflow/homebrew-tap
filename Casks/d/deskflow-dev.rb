cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.50"
  sha256 arm:   "325bb262ee28f65f6bcad8749f8bf4d90b5430fefeeda9c7a2814305b3fbdff5", intel: "5f46a13c329612e1c2012adb5147d968edd51a87c6f06968b3fbfd8cd1de7253"

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
