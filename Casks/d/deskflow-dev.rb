cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.61"
  sha256 arm:   "826c5d8207659dec9c3fc11ffb19fab549cbe2cdfdf2d669629216ab81f00805", intel: "69f5020f7475734848437f0aa98182c12af086f870b01f5aea23bda52d04c227"

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
