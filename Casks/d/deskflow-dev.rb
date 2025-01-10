cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.69"
  sha256 arm:   "5900613d923871cf7939c62bb1935ef9cafd4fbb99ddf16f768ce66661c1bde3", intel: "724a4563387e3e78cd4b789627dc3402f555cf24666db6f13af5a419caf0298f"

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
