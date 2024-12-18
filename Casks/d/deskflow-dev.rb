cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.77"
  sha256 arm:   "52574a52ec573398d2b8a94db6f4e677ddf047bc428bb15b1d0bd606a6497fe2", intel: "c912fe5fd0059c666e35ceb25fcb80fffd6e3b44c029294269aa186291167967"

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
