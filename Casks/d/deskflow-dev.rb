cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.6"
  sha256 arm:   "87c016666b9b99fcb88954faa92c7fefa451faa68fb21495b1204300ed62f27b", intel: "9a095a101076aa16a7370aa4edd6b8e6b73aa5d516e6ab6fcd7feaa72d2b7b57"

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
