cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.285"
  sha256 arm:   "37a66ba2518bf1bbb97cfa9ab99b0e42feaf2d948513dda51a6bc74ddbca6e0a", intel: "b4b9a1bfa7346466461e3f4155c3793683bc31385c25c90b63d0ba4cd40848fb"

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
