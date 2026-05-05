cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.173"
  sha256 arm:   "71f067425639beb964d8d03f85de5f3fc7a15772a09b7b9346eb8259760b93e9", intel: "e3f6c53c7073fffbb85cc02134604de3c25a4e82cd263a79f5fe8fce131f25fd"

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
