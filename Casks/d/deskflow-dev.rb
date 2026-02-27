cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.57"
  sha256 arm:   "e541cfa0b5d51bd5f31a68a3dc5f6ce01a90fb64031d1e6578ea25992012ce18", intel: "d874a04618f542ab87d7063760ebaab401fedec6355f644071ae4323d9616359"

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
