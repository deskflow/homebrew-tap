cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.78"
  sha256 arm:   "867ee908ab1ccbe302be77647a04f227d8052477a156e8fbca13c04328d70ae7", intel: "3eb52c03285742c9fb244184ccde88fce347594370ffa83e8010aff9e1b8497a"

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
