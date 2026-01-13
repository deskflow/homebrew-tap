cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.161"
  sha256 arm:   "dab5cc3f960f27dabf1fc021746255459a85d815b11462bf9ed0b3f018b4bc9a", intel: "1751b040327135f843b88151fbe646b7b17325517b90e8d0f08a4943837cdfce"

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
