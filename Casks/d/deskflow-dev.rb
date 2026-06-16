cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.250"
  sha256 arm:   "12d50f281289714870b774ed36476cdc6168261475a7703d2adbdcd3901203ca", intel: "ea6577175db13c3a3b026f91b102cffd2ab4f18e47573d72443860d2a10024e8"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
