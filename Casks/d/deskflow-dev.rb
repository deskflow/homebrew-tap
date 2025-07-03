cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.128"
  sha256 arm:   "8f01c649db887af9963e80c10fee25f47dff343fa0e65c41d74b7962e5575ae5", intel: "9316a364499f48acc8bbad777cb9fee73665848cebc00ebe6b700aef788a1368"

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
