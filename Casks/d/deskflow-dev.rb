cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.83"
  sha256 arm:   "a66d0efd9028e51a484d42c058719c9c96ade0a27b6c12cda11f82590bee7a6e", intel: "d244d7cb50de5e4da7fd772d25a80944e9d6fcd64c88e8879d12eac8c0651a02"

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
