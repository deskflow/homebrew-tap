cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.227"
  sha256 arm:   "8a49700f8da9a2b05586156775d4f533fa2345181205605f90c0253172598f07", intel: "24ae59e7d4b9559f4ad243fe2a80de0a8e523fe91ab9d94440e27ddb3d4988f4"

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
