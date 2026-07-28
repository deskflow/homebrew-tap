cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.337"
  sha256 arm:   "452c785362f06b8bd8166053a2e2271cb5934ac154c4e5a98535509df61876e3", intel: "0801f654eed96bf8248ed477dc496b795331c06a56f5147e3849e203a907a331"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
