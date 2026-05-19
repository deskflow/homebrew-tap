cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.201"
  sha256 arm:   "8ba8d17b7449ab3bee15a5bb9546c784c0af4368c6170e71f21dcfe137e98448", intel: "4eb4cb4043e283a199db9d8b59d935a57a95992c1cddaf16b501e839ba86585e"

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
