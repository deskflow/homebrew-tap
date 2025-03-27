cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.223"
  sha256 arm:   "6d82d754aa7d5eb2a213adbdbf7cbf84d0205003060e99529b969860aba0a78e", intel: "60c6d0dbb4762434315b1efe9ff1c2dc637465a21380de08f0e9daab0dfd8e72"

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
