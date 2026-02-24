cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.49"
  sha256 arm:   "a1ad35121cbc17b89d7b71b092522758345857dabdbce904dd5c706707cb0e3e", intel: "162fdd6bba58c71154fc118f1bb8e6bba5136603ef361acff23c03772a955f64"

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
