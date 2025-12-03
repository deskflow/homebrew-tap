cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.57"
  sha256 arm:   "3ab176ff86adba52a50587e8c714a5f535928ba4177892a3cc266674bb35faf9", intel: "c9e95cbaf3cf47d35aded87e6c9c7a9e7ad8bfc439e7c7e0f7875bd09af636b1"

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
