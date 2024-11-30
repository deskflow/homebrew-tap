cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.16"
  sha256 arm:   "a8a72b11cf6e00f28acabe1c4b944bc9a6bf728786f1e041c54c8beae1176295", intel: "85639bf0f2f8063dcc1e1c96139584028c62ba564b3732c9980c1779526e413e"

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
