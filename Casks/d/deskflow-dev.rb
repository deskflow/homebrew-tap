cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.90"
  sha256 arm:   "131eae9ff64c5a20917a3273680b2f74ea64ca2ebf348bc2116177b70785b8b3", intel: "dfa7105b5afeb4206ddbc0a5b6af098c4b1eda350b90a06c67946f0f816ca297"

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
