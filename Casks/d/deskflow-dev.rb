cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.0"
  sha256 arm:   "4c157379867ceec5d232ebbb719689fd9d44d711efdc5ea186a23c6615a0d775", intel: "361303e2e166903e1921654e489c5174c8deb635eea5992d0f044e1c2bbda480"

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
