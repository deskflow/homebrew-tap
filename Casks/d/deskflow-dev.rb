cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.62"
  sha256 arm:   "5834bf02761e3a1423aaea6a53fde2d19176ed8cbc44f39153da35008699a722", intel: "32e7160812453f8a653cd076f1687412aef0eccb9de05ae7e33880037a807972"

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
