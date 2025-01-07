cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.15"
  sha256 arm:   "fd1a42af22b1b08b8499955c63e01d63e5d7b2222a69ad4c399162887b6254ea", intel: "0fca315ea2d313d700c2ad0791c41598d381220182acdd274d9d888ccad36471"

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
