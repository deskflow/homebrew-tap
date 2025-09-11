cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.213"
  sha256 arm:   "5e95327330cc9460a705cc66a505de4136b4d9195872834647ebcddba777b631", intel: "8d0e9ce6b1147031b330e2a85ffea420e47a3b4ed646307646185859e171006d"

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
