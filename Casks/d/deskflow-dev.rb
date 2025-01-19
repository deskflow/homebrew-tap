cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.95"
  sha256 arm:   "856cb78c2a578f1a7ba1187db7d42787ae3f8872b03422fdd91b02a068278844", intel: "73e02edf0ac0a7e3f315d06c1af8c290d935eecddd9ce28e571f792393d7ceee"

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
