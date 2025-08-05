cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.46"
  sha256 arm:   "3680c575d5d7d39c817cbf77c542806d0655171e3e81c645e0a2e111d38cda43", intel: "09f45263a0fa94f9a098467207cc11ddf020f001ccd0df38441ff752e4933b75"

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
