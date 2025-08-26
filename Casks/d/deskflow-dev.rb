cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.149"
  sha256 arm:   "d7ec6157cea6cbd12c451dd53369c21b94fd03a2def2ab9e095120e63e7c5391", intel: "12c17962f54ef8bd1a9784114255d897dd8202d33061feb9fdc59a698625f6ad"

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
