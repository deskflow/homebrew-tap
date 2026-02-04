cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.221"
  sha256 arm:   "9fb12f1e2655325bb0fc8e300886daf4e1a2f2bf2cb8752c5daed7e0ba702966", intel: "6f79d5e026dbbc63781a9683b52b64a13453fb10faeb78b392dd637d50be8be5"

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
