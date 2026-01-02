cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.139"
  sha256 arm:   "d335943b58032512d5ae3e834a88a4fda4cb4987ac4f6f377aaa76f58bb8610d", intel: "d169aafb3a003a221cef4969a1852098ad461518501050ed790e0e3ffc7e4e36"

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
