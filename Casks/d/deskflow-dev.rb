cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.93"
  sha256 arm:   "0a6535b3569e07b158c27053ac0266f5a66baa2e19d4b65b3729520c1ffb90d3", intel: "71cbc7be2ec4dc126107d3d9424cfa4b45f5d60ff11db6a7bfed33d6a0642563"

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
