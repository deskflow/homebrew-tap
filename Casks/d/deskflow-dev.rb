cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.166"
  sha256 arm:   "92193a53c2adfc470c84e1abb4194beeef3dc18c7828d0d3ba036089c6343c9f", intel: "08d35d16688b0481a9105a4cb899aad551446b94d0c4a4a30e547c465dbc8b05"

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
