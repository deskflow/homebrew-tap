cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.171"
  sha256 arm:   "62b3d28c6d91b094b612114a9839dd6d27e44c4d2f05a8ec2d162364c896a8d2", intel: "c549ac7b40127a09e11744c3431f5a612a32ec758f67dbee2b59079fd91c3319"

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
