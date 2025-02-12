cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.34"
  sha256 arm:   "5226e71aa9d2550e82ee544602ee5da544a723c98aeee0c449b9b262b1b8ae84", intel: "e151c3fa3ec5c831d992d88c454ae9b6536e6ef75fb7b7f97bcc4105576ea6cc"

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
