cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.239"
  sha256 arm:   "a3f300110282d207befeae010352933bed781e0fc777153beb8cbe6016648875", intel: "db88c3a0f55668f6e642f10f66cfb09752999bfed24df2c3661042a1d1fd4a67"

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
