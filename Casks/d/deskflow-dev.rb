cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.27"
  sha256 arm:   "0149c9ed9c792440a2259716499312c965ed29932516532d23caa74bc6a75b38", intel: "6f83c8d36beec81cae7653eedd9d8a0d57e6f131c7037c0d533cc9f9162d8353"

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
