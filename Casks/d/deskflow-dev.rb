cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.143"
  sha256 arm:   "b0cb20657e700ecb365addfff4bf7e4ce2a4d58bfe7c954139ab95262c85647c", intel: "d50fb3cf83bed43ed42bc351fc5bfde89110b194b4497bbd27eba847126ed2ce"

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
