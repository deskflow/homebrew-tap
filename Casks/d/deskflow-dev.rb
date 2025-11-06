cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.222"
  sha256 arm:   "68099c991e64f8b629142e038fd3b51122e2756c074e5be3c6b3d6d0d4576801", intel: "79b8cd34c7ed0f10382bdd426c73aae3f6f077f98771a3fbf9469675f770621c"

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
