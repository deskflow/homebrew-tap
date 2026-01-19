cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.171"
  sha256 arm:   "0e0918984448082b200faaa6d584124be44f170bc9aaf57a3782c807fc86bee8", intel: "8b2fa5a7f9979c14e0abf958fc3270cbf26a2f99ee4262155d1119e44beaf498"

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
