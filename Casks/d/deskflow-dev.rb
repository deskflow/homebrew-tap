cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.160"
  sha256 arm:   "2f86edd72b4d6818a35bbeddde38aa9bd61562c47521c39d44b6347476c84e63", intel: "d86417b5008fad1f3320d380be6f083cf326e3d2646d07c332832b55eefee4c8"

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
